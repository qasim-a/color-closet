import sys
import os
sys.path.append(".")

import csv
from app.database import SessionLocal
from app.models.product import Product
from app.services.color import normalize_color

ARCHIVE_DIR = "../archive"
IMAGES_DIR = os.path.join(ARCHIVE_DIR, "images")

# only import these subcategories
ALLOWED_SUBCATEGORIES = {
    "Topwear",
    "Bottomwear",
}

# map kaggle baseColour to our palette
KAGGLE_COLOR_MAP = {
    "navy blue": "blue",
    "blue": "blue",
    "black": "black",
    "white": "white",
    "grey": "gray",
    "gray": "gray",
    "green": "green",
    "red": "red",
    "pink": "pink",
    "purple": "purple",
    "yellow": "yellow",
    "orange": "orange",
    "beige": "beige",
    "brown": "brown",
    "cream": "white",
    "off white": "white",
    "maroon": "burgundy",
    "burgundy": "burgundy",
    "olive": "olive",
    "khaki": "olive",
    "teal": "turquoise",
    "turquoise": "turquoise",
    "coral": "orange",
    "peach": "beige",
    "skin": "beige",
    "nude": "beige",
    "tan": "beige",
    "camel": "beige",
    "coffee brown": "brown",
    "rust": "brown",
    "mustard": "yellow",
    "gold": "yellow",
    "lime green": "olive",
    "fluorescent green": "green",
    "sea green": "green",
    "magenta": "pink",
    "lavender": "purple",
    "mauve": "pink",
    "rose": "pink",
    "silver": "gray",
    "charcoal": "gray",
    "taupe": "beige",
    "cobalt blue": "blue",
    "steel": "gray",
    "copper": "brown",
    "bronze": "brown",
    "violet": "purple",
    "indigo": "blue",
    "ink blue": "blue",
    "sky blue": "sky",
    "light blue": "sky",
    "powder blue": "sky",
    "baby blue": "sky",
    "steel blue": "sky",
    "electric blue": "sky",
}

TARGET_PER_COLOR = 30
COLOR_COUNTS: dict[str, int] = {}
MAX_TOTAL = 500


def run():
    db = SessionLocal()
    imported = 0
    skipped = 0

    with open(os.path.join(ARCHIVE_DIR, "styles.csv"), newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)

        for row in reader:
            if imported >= MAX_TOTAL:
                break

            # only apparel topwear/bottomwear
            if row["masterCategory"] != "Apparel":
                continue
            if row["subCategory"] not in ALLOWED_SUBCATEGORIES:
                continue

            # check image exists
            image_path = os.path.join(IMAGES_DIR, f"{row['id']}.jpg")
            if not os.path.exists(image_path):
                continue

            # map color
            raw_color = row["baseColour"].strip().lower()
            palette = KAGGLE_COLOR_MAP.get(raw_color)
            if not palette:
                skipped += 1
                continue

            # enforce per-color limit
            if COLOR_COUNTS.get(palette, 0) >= TARGET_PER_COLOR:
                continue

            # skip if already in DB
            product_id = int(row["id"])
            existing = db.query(Product).filter(Product.id == product_id).first()
            if existing:
                continue

            product = Product(
                id=product_id,
                name=row["productDisplayName"],
                brand_name="Kaggle Fashion",
                price_value=None,
                price_text=None,
                colour_raw=row["baseColour"],
                colour_normalized=normalize_color(raw_color),
                colour_hex=None,
                palette_colors=palette,
                image_url=f"/kaggle-images/{row['id']}.jpg",
                product_url="#",
                is_marked_down=False,
            )
            db.add(product)
            COLOR_COUNTS[palette] = COLOR_COUNTS.get(palette, 0) + 1
            imported += 1

            if imported % 50 == 0:
                db.commit()
                print(f"Imported {imported} products so far...")

    db.commit()
    db.close()
    print(f"\nDone. Imported {imported} products. Skipped {skipped} due to unmapped colors.")
    print("\nColor distribution:")
    for color, count in sorted(COLOR_COUNTS.items()):
        print(f"  {color}: {count}")


if __name__ == "__main__":
    run()