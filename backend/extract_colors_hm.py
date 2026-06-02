import sys
sys.path.append(".")

import requests
from io import BytesIO
from PIL import Image
import numpy as np
from sklearn.cluster import KMeans
from app.database import SessionLocal
from app.models.product import Product
from app.services.color import hex_to_rgb, hsl_color_distance

PALETTE = {
    "black":     "#141414",
    "white":     "#f2f2f2",
    "gray":      "#808080",
    "beige":     "#c8ab85",
    "brown":     "#6b3d1e",
    "red":       "#c42020",
    "burgundy":  "#7a1830",
    "orange":    "#e06820",
    "yellow":    "#e0b820",
    "olive":     "#6b7a28",
    "green":     "#258525",
    "turquoise": "#1ab5c0",
    "sky":       "#3a90d4",
    "blue":      "#2540b8",
    "purple":    "#6820aa",
    "pink":      "#e06890",
}


def extract_hex(image_url: str) -> str | None:
    try:
        headers = {
            "User-Agent": "Mozilla/5.0",
        }
        response = requests.get(image_url, timeout=15, headers=headers)
        response.raise_for_status()

        img = Image.open(BytesIO(response.content)).convert("RGB")
        img = img.resize((100, 100))

        pixels = np.array(img).reshape(-1, 3).astype(float)

        # filter near-white pixels (white backgrounds)
        white_mask = ~(
            (pixels[:, 0] > 230) &
            (pixels[:, 1] > 230) &
            (pixels[:, 2] > 230)
        )
        pixels = pixels[white_mask]

        # filter near-neutral gray pixels (H&M gray background ~#d3d3d3)
        gray_mask = ~(
            (pixels[:, 0] > 190) &
            (pixels[:, 1] > 190) &
            (pixels[:, 2] > 190) &
            (np.abs(pixels[:, 0] - pixels[:, 1]) < 15) &
            (np.abs(pixels[:, 1] - pixels[:, 2]) < 15) &
            (np.abs(pixels[:, 0] - pixels[:, 2]) < 15)
        )
        pixels = pixels[gray_mask]

        if len(pixels) < 20:
            return None

        # weight center pixels more heavily
        # reshape to 2d grid to identify center region
        # after filtering we can't do spatial weighting easily
        # so just use KMeans on remaining pixels
        kmeans = KMeans(n_clusters=5, n_init=5, random_state=42)
        kmeans.fit(pixels)

        counts = np.bincount(kmeans.labels_)
        dominant = kmeans.cluster_centers_[np.argmax(counts)]
        r, g, b = [int(x) for x in dominant]
        return f"#{r:02x}{g:02x}{b:02x}"

    except Exception as e:
        return None


def assign_palette(hex_color: str) -> str | None:
    rgb = hex_to_rgb(hex_color)
    if not rgb:
        return None

    scored = []
    for name, palette_hex in PALETTE.items():
        palette_rgb = hex_to_rgb(palette_hex)
        if palette_rgb:
            dist = hsl_color_distance(rgb, palette_rgb)
            scored.append((dist, name))

    scored.sort(key=lambda x: x[0])
    return scored[0][1] if scored else None


def run():
    db = SessionLocal()

    products = db.query(Product).filter(
        Product.colour_hex.is_(None)
    ).all()

    print(f"Processing {len(products)} products without extracted hex...")

    success = 0
    failed = 0
    reassigned = 0

    for i, product in enumerate(products):
        if not product.image_url:
            db.delete(product)
            failed += 1
            continue

        # test if image is accessible before processing
        try:
            test = requests.head(product.image_url, timeout=5)
            if test.status_code != 200:
                print(f"  Deleting product {product.id} — image returned {test.status_code}")
                db.delete(product)
                failed += 1
                continue
        except Exception:
            print(f"  Deleting product {product.id} — image unreachable")
            db.delete(product)
            failed += 1
            continue

        hex_val = extract_hex(product.image_url)

        if hex_val:
            old_palette = product.palette_colors
            new_palette = assign_palette(hex_val)

            product.colour_hex = hex_val
            if new_palette:
                product.palette_colors = new_palette
                if new_palette != old_palette:
                    reassigned += 1

            success += 1
        else:
            failed += 1

        if (i + 1) % 50 == 0:
            db.commit()
            print(f"  [{i+1}/{len(products)}] {success} extracted, {failed} failed, {reassigned} reassigned")

    db.commit()
    db.close()

    print(f"\nDone.")
    print(f"  Extracted: {success}")
    print(f"  Failed: {failed}")
    print(f"  Palette reassigned: {reassigned}")


if __name__ == "__main__":
    run()