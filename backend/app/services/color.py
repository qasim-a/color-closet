import requests
from io import BytesIO
from PIL import Image
import numpy as np
from sklearn.cluster import KMeans

# Maps normalized color names to their representative hex values
COLOR_MAP = {
    "black": "#1a1a1a",
    "white": "#f5f5f5",
    "ivory": "#fffff0",
    "cream": "#fffdd0",
    "ecru": "#c2b280",
    "beige": "#d4b896",
    "tan": "#c4a882",
    "camel": "#c19a6b",
    "brown": "#8b5e3c",
    "chocolate": "#5c3317",
    "navy": "#1b2a4a",
    "cobalt": "#0047ab",
    "royal blue": "#4169e1",
    "sky blue": "#87ceeb",
    "powder blue": "#b0d4e8",
    "copenhagen blue": "#2a52be",
    "teal": "#008080",
    "gray": "#808080",
    "light gray": "#d3d3d3",
    "charcoal": "#36454f",
    "red": "#cc0000",
    "burgundy": "#800020",
    "wine": "#722f37",
    "coral": "#ff6b6b",
    "orange": "#e8751a",
    "yellow": "#f5c518",
    "gold": "#c9a84c",
    "olive": "#708238",
    "sage": "#8fad88",
    "forest green": "#228b22",
    "mint": "#98d8c8",
    "emerald": "#50c878",
    "pink": "#ffb6c1",
    "hot pink": "#ff69b4",
    "blush": "#f4b8b8",
    "mauve": "#8b6b8a",
    "dusty rose": "#dcae96",
    "purple": "#6a0dad",
    "lavender": "#c9a9d4",
    "lilac": "#c8a2c8",
    "denim": "#1560bd",
    "multi": "#ffffff",
}

# Maps ASOS raw color labels to our normalized names
ASOS_COLOR_NORMALIZATION = {
    "black": "black",
    "white": "white",
    "ancient white": "white",
    "ecru": "ecru",
    "denim white": "white",
    "navy iris": "navy",
    "dark night navy": "navy",
    "dark navy": "navy",
    "navy": "navy",
    "copenhagen blue": "copenhagen blue",
    "denim medium": "denim",
    "denim dark": "denim",
    "blue": "cobalt",
    "red": "red",
    "pink": "pink",
    "green": "forest green",
    "courtside green": "sage",
    "mgreen": "sage",
    "gray": "gray",
    "grey": "gray",
    "ice gray heather": "light gray",
    "ice grey heather": "light gray",
    "brown": "brown",
    "beige": "beige",
    "sandalwood": "tan",
    "gentle gold": "gold",
    "citronella": "yellow",
    "orange": "orange",
    "purple": "purple",
    "multi": "multi",
    "neutral": "beige",
    "silver": "light gray",
}


def normalize_color(raw_color: str) -> str:
    if not raw_color:
        return "unknown"
    return ASOS_COLOR_NORMALIZATION.get(raw_color.lower(), raw_color.lower())


def extract_hex_from_image(image_url: str) -> str | None:
    try:
        response = requests.get(image_url, timeout=5)
        response.raise_for_status()

        img = Image.open(BytesIO(response.content)).convert("RGB")
        img = img.resize((100, 100))  # small for speed

        pixels = np.array(img).reshape(-1, 3)

        # remove near-white background pixels
        mask = ~(
            (pixels[:, 0] > 220) &
            (pixels[:, 1] > 220) &
            (pixels[:, 2] > 220)
        )
        pixels = pixels[mask]

        if len(pixels) < 10:
            return None

        kmeans = KMeans(n_clusters=3, n_init=3, random_state=42)
        kmeans.fit(pixels)

        # pick the largest cluster
        counts = np.bincount(kmeans.labels_)
        dominant = kmeans.cluster_centers_[np.argmax(counts)]
        r, g, b = [int(x) for x in dominant]
        return f"#{r:02x}{g:02x}{b:02x}"

    except Exception:
        return None


def get_color_hex(normalized_color: str) -> str | None:
    return COLOR_MAP.get(normalized_color)

def hex_to_rgb(hex_color: str) -> tuple | None:
    try:
        hex_color = hex_color.lstrip('#')
        return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))
    except Exception:
        return None


def color_distance(rgb1: tuple, rgb2: tuple) -> float:
    return (
        (rgb1[0] - rgb2[0]) ** 2 +
        (rgb1[1] - rgb2[1]) ** 2 +
        (rgb1[2] - rgb2[2]) ** 2
    ) ** 0.5
def rgb_to_hsl(rgb: tuple) -> tuple:
    r, g, b = rgb[0] / 255, rgb[1] / 255, rgb[2] / 255
    max_c = max(r, g, b)
    min_c = min(r, g, b)
    l = (max_c + min_c) / 2
    
    if max_c == min_c:
        h = s = 0.0
    else:
        d = max_c - min_c
        s = d / (2 - max_c - min_c) if l > 0.5 else d / (max_c + min_c)
        if max_c == r:
            h = (g - b) / d + (6 if g < b else 0)
        elif max_c == g:
            h = (b - r) / d + 2
        else:
            h = (r - g) / d + 4
        h /= 6

    return (h * 360, s * 100, l * 100)


def hsl_color_distance(rgb1: tuple, rgb2: tuple) -> float:
    h1, s1, l1 = rgb_to_hsl(rgb1)
    h2, s2, l2 = rgb_to_hsl(rgb2)

    # hue is circular so take the shortest path
    hue_diff = min(abs(h1 - h2), 360 - abs(h1 - h2))

    # weight hue more heavily than saturation and lightness
    # hue difference of 30 degrees is very noticeable
    # saturation and lightness differences matter less
    return (
        (hue_diff * 2) ** 2 +
        (s1 - s2) ** 2 +
        (l1 - l2) ** 2
    ) ** 0.5