import sys
import hashlib
sys.path.append(".")

from datasets import load_dataset
from app.database import SessionLocal
from app.models.product import Product
from app.services.color import normalize_color

ALLOWED_TYPES = {
    # tops
    "Shirt",
    "Blouse",
    "Sweater",
    "Hoodie",
    "Cardigan",
    "Polo shirt",
    "T-shirt",
    # jackets/outerwear
    "Jacket",
    "Coat",
    "Blazer",
    "Outdoor Waistcoat",
    # bottoms
    "Trousers",
    "Shorts",
    "Skirt",
    "Outdoor trousers",
    # shoes
    "Sneakers",
    "Boots",
    "Sandals",
    "Flat shoe",
    "Other shoe",
    "Ballerinas",
    "Wedge",
    # accessories
    "Belt",
    "Scarf",
    "Sunglasses",
    "Hat/beanie",
    "Hat/brim",
    "Cap/peaked",
    "Bag",
    "Watch",
    "Wallet",
    "Necklace",
    "Bracelet",
    "Earring",
}

EXCLUDED_APPEARANCES = {
    "stripe", "stripes", "check", "print", "mixed print",
    "lace", "embroidery", "broderie anglaise", "application/3d",
    "placement print", "all over pattern", "jacquard",
}

HM_COLOR_MAP = {
    "black": "black",
    "white": "white",
    "off white": "white",
    "grey": "gray",
    "light grey": "gray",
    "dark grey": "gray",
    "beige": "beige",
    "khaki beige": "beige",
    "mole": "beige",
    "sand": "beige",
    "brown": "brown",
    "dark brown": "brown",
    "copper": "brown",
    "rust": "brown",
    "red": "red",
    "bright red": "red",
    "dark red": "red",
    "burgundy": "red",
    "dark purple": "red",
    "orange": "orange",
    "light orange": "orange",
    "yellow": "yellow",
    "light yellow": "yellow",
    "khaki green": "olive",
    "dark green": "green",
    "green": "green",
    "light green": "green",
    "turquoise": "turquoise",
    "light turquoise": "turquoise",
    "light blue": "blue",
    "dusty blue": "blue",
    "blue": "blue",
    "dark blue": "blue",
    "navy blue": "blue",
    "purple": "purple",
    "light purple": "purple",
    "mauve": "purple",
    "lilac purple": "purple",
    "pink": "pink",
    "light pink": "pink",
    "dusty pink": "pink",
    "dark pink": "pink",
    "light blue": "blue",
    "sky blue": "blue", 
    "powder blue": "blue",
    "baby blue": "blue",
    "azure": "blue",
    "cornflower blue": "blue",
    "steel blue": "blue",
    "medium blue": "blue",
    "bright blue": "blue",
    "ice blue": "blue",
    "denim blue": "blue",
}

TARGET_PER_COLOR = 50
MAX_TOTAL = 800


def run():
    db = SessionLocal()
    color_counts: dict[str, int] = {}
    imported = 0
    skipped_color = 0
    skipped_group = 0
    skipped_appearance = 0
    skipped_limit = 0

    print("Loading H&M dataset (streaming)...")
    ds = load_dataset(
        "Qdrant/hm_ecommerce_products",
        split="train",
        streaming=True
    )

    for sample in ds:
        if imported >= MAX_TOTAL:
            break

        # filter by product type
        group = sample.get("product_type_name", "")
        if group not in ALLOWED_TYPES:
            skipped_group += 1
            continue

        # filter out patterns
        appearance = sample.get("graphical_appearance_name", "").lower()
        if appearance in EXCLUDED_APPEARANCES:
            skipped_appearance += 1
            continue

        # map color
        raw_color = sample.get("perceived_colour_master_name", "").lower().strip()
        palette = HM_COLOR_MAP.get(raw_color)
        if not palette:
            skipped_color += 1
            continue

        # enforce per-color limit
        if color_counts.get(palette, 0) >= TARGET_PER_COLOR:
            skipped_limit += 1
            continue

        image_url = sample.get("image_url", "")
        if not image_url:
            continue

        article_id = sample.get("article_id", "")
        try:
            # deterministic 9-digit ID from article_id
            hash_val = int(hashlib.md5(article_id.encode()).hexdigest()[:7], 16)
            product_id = 900000000 + (hash_val % 99999999)
        except Exception:
            continue

        existing = db.query(Product).filter(Product.id == product_id).first()
        if existing:
            continue

        product = Product(
            id=product_id,
            name=sample.get("prod_name", ""),
            brand_name="H&M",
            price_value=None,
            price_text=None,
            colour_raw=sample.get("perceived_colour_master_name", ""),
            colour_normalized=normalize_color(raw_color),
            colour_hex=None,
            palette_colors=palette,
            image_url=image_url,
            product_url="https://www.hm.com",
            is_marked_down=False,
        )
        db.add(product)
        color_counts[palette] = color_counts.get(palette, 0) + 1
        imported += 1

        if imported % 50 == 0:
            db.commit()
            print(f"Imported {imported} so far...")

    db.commit()
    db.close()

    print(f"\nDone. Imported {imported} products.")
    print(f"Skipped: {skipped_group} wrong group, {skipped_appearance} patterns, {skipped_color} unmapped colors, {skipped_limit} over limit")
    print("\nColor distribution:")
    for color, count in sorted(color_counts.items()):
        print(f"  {color}: {count}")


if __name__ == "__main__":
    run()