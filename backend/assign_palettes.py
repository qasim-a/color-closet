import sys
import os
sys.path.append(".")

import psycopg2
from dotenv import load_dotenv
from app.services.color import hex_to_rgb, hsl_color_distance

load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL")

PALETTE = {
    "black":     "#141414",
    "white":     "#f2f2f2",
    "gray":      "#808080",
    "beige":     "#c8ab85",
    "brown":     "#6b3d1e",
    "red":       "#b03040",
    "orange":    "#e06820",
    "yellow":    "#e0b820",
    "olive":     "#6b7a28",
    "green":     "#258525",
    "turquoise": "#1ab5c0",
    "blue":      "#2e6fbd",
    "purple":    "#6820aa",
    "pink":      "#e06890",
}

LABEL_TO_PALETTE = {
    # --- black ---
    "black":            "black",
    "washed black":     "black",
    "phantom":          "black",

    # --- white ---
    "white":            "white",
    "ancient white":    "white",
    "ecru":             "white",
    "ivory":            "white",
    "cream":            "white",
    "denim white":      "white",
    "off white":        "white",
    "coconut milk":     "white",

    # --- gray ---
    "gray":             "gray",
    "grey":             "gray",
    "ice gray heather": "gray",
    "ice grey heather": "gray",
    "washed gray":      "gray",
    "charcoal":         "gray",
    "silver":           "gray",

    # --- beige ---
    "beige":            "beige",
    "camel":            "beige",
    "tan":              "beige",
    "sand":             "beige",
    "nude":             "beige",
    "stone":            "beige",
    "taupe":            "beige",
    "sandalwood":       "beige",
    "buttermilk":       "beige",
    "butter":           "beige",
    "gentle gold":      "beige",
    "neutral":          "beige",
    "roasted cashew":   "beige",

    # --- brown ---
    "brown":            "brown",
    "chocolate":        "brown",
    "mocha":            "brown",
    "coffee":           "brown",
    "cognac":           "brown",
    "rust":             "brown",
    "ganache":          "brown",
    "toffee":           "brown",

    # --- red (includes burgundy) ---
    "red":              "red",
    "fiery red":        "red",
    "burnt red":        "red",
    "bright red":       "red",
    "tomato":           "red",
    "cherry":           "red",
    "burgundy":         "red",
    "wine":             "red",
    "plum":             "red",
    "maroon":           "red",
    "oxblood":          "red",
    "rosewood":         "red",
    "ecru burgundy":    "red",

    # --- orange ---
    "orange":           "orange",
    "burnt orange":     "orange",
    "coral":            "orange",
    "terracotta":       "orange",
    "amber":            "orange",

    # --- yellow ---
    "yellow":           "yellow",
    "lemon":            "yellow",
    "mustard":          "yellow",
    "gold":             "yellow",
    "citronella":       "yellow",
    "light yellow":     "yellow",
    "butter yellow":    "yellow",
    "gold tone":        "yellow",

    # --- olive ---
    "olive":            "olive",
    "olive green":      "olive",
    "khaki":            "olive",
    "army":             "olive",
    "military":         "olive",
    "moss":             "olive",
    "lime":             "olive",
    "lime green":       "olive",

    # --- green ---
    "green":            "green",
    "forest green":     "green",
    "emerald":          "green",
    "sage":             "green",
    "mint":             "green",
    "light sage":       "green",
    "courtside green":  "green",
    "mgreen":           "green",
    "vibrant green":    "green",
    "matcha green":     "green",


    # --- turquoise ---
    "teal":             "turquoise",
    "turquoise":        "turquoise",
    "jade":             "turquoise",

    # --- blue (includes sky) ---
    "blue":             "blue",
    "cobalt":           "blue",
    "royal blue":       "blue",
    "electric blue":    "blue",
    "slate blue":       "blue",
    "navy":             "blue",
    "navy iris":        "blue",
    "dark night navy":  "blue",
    "dark navy":        "blue",
    "denim dark":       "blue",
    "denim medium":     "blue",
    "denim":            "blue",
    "indigo":           "blue",
    "light blue":       "blue",
    "sky blue":         "blue",
    "powder blue":      "blue",
    "baby blue":        "blue",
    "bright blue":      "blue",
    "copenhagen blue":  "blue",
    "mid blue":         "blue",
    "lblue":            "blue",


    # --- purple ---
    "purple":           "purple",
    "violet":           "purple",
    "lavender":         "purple",
    "lilac":            "purple",
    "mauve":            "purple",

    # --- pink ---
    "pink":             "pink",
    "hot pink":         "pink",
    "fuchsia":          "pink",
    "magenta":          "pink",
    "blush":            "pink",
    "dusty rose":       "pink",
    "rose":             "pink",
    "salmon":           "pink",
    "pale pink":        "pink",
    "light pink":       "pink",
    "prism pink":       "pink",
    "pale lilac":       "pink",
    "pink rosey print": "pink",



    # --- excluded patterns ---
    "polka dot":            None,
    "multi":                None,
    "floral":               None,
    "stripe":               None,
    "multi floral":         None,
    "bloom floral":         None,
    "lime floral":          None,
    "dot print":            None,
    "ivory dot print":      None,
    "cream polka dot":      None,
    "red polka":            None,
    "navy spot":            None,
    "mono spot":            None,
    "blue stripe":          None,
    "red stripe":           None,
    "navy stripe":          None,
    "green stripe":         None,
    "yellow stripe":        None,
    "yellow/green stripe":  None,
    "sunset stripe":        None,
    "paisley":              None,
}

# color words to scan for in product names
NAME_COLOR_WORDS = {
    "black": "black",
    "white": "white",
    "ivory": "white",
    "cream": "white",
    "ecru": "white",
    "gray": "gray",
    "grey": "gray",
    "silver": "gray",
    "charcoal": "gray",
    "beige": "beige",
    "camel": "beige",
    "tan": "beige",
    "nude": "beige",
    "sand": "beige",
    "stone": "beige",
    "taupe": "beige",
    "brown": "brown",
    "chocolate": "brown",
    "toffee": "brown",
    "mocha": "brown",
    "rust": "brown",
    "red": "red",
    "cherry": "red",
    "tomato": "red",
    "burgundy": "red",
    "wine": "red",
    "maroon": "red",
    "plum": "red",
    "orange": "orange",
    "coral": "orange",
    "terracotta": "orange",
    "amber": "orange",
    "yellow": "yellow",
    "lemon": "yellow",
    "mustard": "yellow",
    "gold": "yellow",
    "butter": "yellow",
    "olive": "olive",
    "khaki": "olive",
    "lime": "olive",
    "green": "green",
    "sage": "green",
    "mint": "green",
    "emerald": "green",
    "teal": "turquoise",
    "turquoise": "turquoise",
    "navy": "blue",
    "denim": "blue",
    "indigo": "blue",
    "blue": "blue",
    "cobalt": "blue",
    "purple": "purple",
    "lilac": "purple",
    "lavender": "purple",
    "violet": "purple",
    "mauve": "purple",
    "pink": "pink",
    "blush": "pink",
    "rose": "pink",
    "fuchsia": "pink",
    "magenta": "pink",
    "salmon": "pink",
}

def palette_from_name(name: str) -> str | None:
    words = name.lower().split()
    for word in words:
        # strip punctuation
        word = word.strip('.,-()')
        if word in NAME_COLOR_WORDS:
            return NAME_COLOR_WORDS[word]
    return None


def assign_palette(colour_raw: str, colour_hex: str | None, name: str = "") -> str:
    raw = colour_raw.lower().strip()

    # step 1 — label lookup
    if raw in LABEL_TO_PALETTE:
        primary = LABEL_TO_PALETTE[raw]
        if primary is None:
            return ""
        return primary

    # step 2 — scan product name for color words
    if name:
        from_name = palette_from_name(name)
        if from_name:
            return from_name

    # step 3 — fall back to extracted hex
    source_hex = colour_hex
    if not source_hex:
        return ""

    source_rgb = hex_to_rgb(source_hex)
    if not source_rgb:
        return ""

    scored = []
    for palette_name, hex_val in PALETTE.items():
        rgb = hex_to_rgb(hex_val)
        if rgb:
            dist = hsl_color_distance(source_rgb, rgb)
            scored.append((dist, palette_name))

    scored.sort(key=lambda x: x[0])
    return scored[0][1] if scored else ""


def run():
    conn = psycopg2.connect(DATABASE_URL)
    cur = conn.cursor()

    cur.execute("SELECT id, colour_raw, colour_hex, name FROM products")
    products = cur.fetchall()
    updated = 0
    for product_id, colour_raw, colour_hex, name in products:
        if not colour_raw:
            continue
        palette = assign_palette(colour_raw, colour_hex, name or "")
        if palette:
            cur.execute(
                "UPDATE products SET palette_colors = %s WHERE id = %s",
                (palette, product_id)
            )
            updated += 1
            print(f"id={product_id} → {palette}")

    conn.commit()
    cur.close()
    conn.close()
    print(f"\nDone. Assigned palettes to {updated} products.")


if __name__ == "__main__":
    run()