import sys
sys.path.append(".")

import requests
from io import BytesIO
from PIL import Image
import numpy as np
from sklearn.cluster import KMeans
from concurrent.futures import ThreadPoolExecutor, as_completed
from app.database import SessionLocal
from app.models.product import Product
from app.services.color import hex_to_rgb, hsl_color_distance, rgb_to_hsl

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


def palette_assignment_distance(rgb1: tuple, rgb2: tuple) -> float:
    h1, s1, l1 = rgb_to_hsl(rgb1)
    h2, s2, l2 = rgb_to_hsl(rgb2)

    hue_diff = min(abs(h1 - h2), 360 - abs(h1 - h2))

    # for very desaturated colors — hue is meaningless
    if s1 < 15:
        return (s1 - s2) ** 2 + (l1 - l2) ** 2

    # hue dominates, saturation secondary, lightness barely matters
    return (hue_diff * 3) ** 2 + (s1 - s2) ** 2 * 0.5


def assign_palette(hex_color: str) -> str | None:
    rgb = hex_to_rgb(hex_color)
    if not rgb:
        return None

    scored = []
    for name, palette_hex in PALETTE.items():
        palette_rgb = hex_to_rgb(palette_hex)
        if palette_rgb:
            dist = palette_assignment_distance(rgb, palette_rgb)
            scored.append((dist, name))

    scored.sort(key=lambda x: x[0])
    return scored[0][1] if scored else None


def extract_hex(image_url: str) -> str | None:
    try:
        response = requests.get(image_url, timeout=10)
        if response.status_code != 200:
            return "DELETE"

        img = Image.open(BytesIO(response.content)).convert("RGB")
        img = img.resize((100, 100))

        pixels = np.array(img).reshape(-1, 3).astype(float)

        # filter white background
        white_mask = ~(
            (pixels[:, 0] > 230) &
            (pixels[:, 1] > 230) &
            (pixels[:, 2] > 230)
        )
        pixels = pixels[white_mask]

        # filter neutral gray (H&M background)
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

        kmeans = KMeans(n_clusters=5, n_init=5, random_state=42)
        kmeans.fit(pixels)

        # skip largest cluster (likely remaining background)
        counts = np.bincount(kmeans.labels_)
        sorted_indices = np.argsort(counts)[::-1]
        
        # try second largest cluster first if largest is suspiciously neutral
        dominant_idx = sorted_indices[0]
        dominant = kmeans.cluster_centers_[dominant_idx]
        r, g, b = [int(x) for x in dominant]
        
        # check if dominant is still background-like
        h, s, l = rgb_to_hsl((r, g, b))
        if s < 10 and l > 60 and len(sorted_indices) > 1:
            # fall back to second cluster
            dominant = kmeans.cluster_centers_[sorted_indices[1]]
            r, g, b = [int(x) for x in dominant]

        return f"#{r:02x}{g:02x}{b:02x}"

    except Exception:
        return None


def process_product(product_data: tuple) -> tuple:
    product_id, image_url, old_palette = product_data
    hex_val = extract_hex(image_url)
    return product_id, hex_val, old_palette


def run():
    db = SessionLocal()

    products = db.query(Product).filter(
        Product.colour_hex.is_(None)
    ).all()

    print(f"Processing {len(products)} products...")

    product_data = [
        (p.id, p.image_url, p.palette_colors)
        for p in products
        if p.image_url
    ]

    results = {}
    with ThreadPoolExecutor(max_workers=10) as executor:
        futures = {
            executor.submit(process_product, data): data[0]
            for data in product_data
        }
        completed = 0
        for future in as_completed(futures):
            product_id, hex_val, old_palette = future.result()
            results[product_id] = (hex_val, old_palette)
            completed += 1
            if completed % 50 == 0:
                print(f"  {completed}/{len(product_data)} done...")

    success = 0
    failed = 0
    deleted = 0
    reassigned = 0

    for product_id, (hex_val, old_palette) in results.items():
        product = db.query(Product).filter(Product.id == product_id).first()
        if not product:
            continue

        if hex_val == "DELETE" or hex_val is None:
            if hex_val == "DELETE":
                db.delete(product)
                deleted += 1
            else:
                failed += 1
            continue

        new_palette = assign_palette(hex_val)
        product.colour_hex = hex_val
        if new_palette:
            product.palette_colors = new_palette
            if new_palette != old_palette:
                reassigned += 1
        success += 1

    db.commit()
    db.close()

    print(f"\nDone.")
    print(f"  Extracted: {success}")
    print(f"  Failed: {failed}")
    print(f"  Deleted (broken images): {deleted}")
    print(f"  Palette reassigned: {reassigned}")


if __name__ == "__main__":
    run()