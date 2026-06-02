from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session
from app.database import get_db
from app.models.product import Product
from app.schemas.product import ProductOut
from app.services.color import hex_to_rgb, hsl_color_distance, rgb_to_hsl

router = APIRouter()

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

MAX_COLOR_DISTANCE = 80


def palette_assignment_distance(rgb1: tuple, rgb2: tuple) -> float:
    h1, s1, l1 = rgb_to_hsl(rgb1)
    h2, s2, l2 = rgb_to_hsl(rgb2)

    hue_diff = min(abs(h1 - h2), 360 - abs(h1 - h2))

    if s1 < 15:
        return (s1 - s2) ** 2 + (l1 - l2) ** 2

    return (hue_diff * 3) ** 2 + (s1 - s2) ** 2 * 0.5


@router.get("/color", response_model=list[ProductOut])
def get_products_by_color(
    hex: str = Query(..., description="Hex color e.g. #ff0000"),
    db: Session = Depends(get_db)
):
    target_rgb = hex_to_rgb(hex)
    if not target_rgb:
        return []

    best_palette = None
    best_dist = float('inf')
    for name, palette_hex in PALETTE.items():
        palette_rgb = hex_to_rgb(palette_hex)
        if palette_rgb:
            dist = palette_assignment_distance(target_rgb, palette_rgb)
            if dist < best_dist:
                best_dist = dist
                best_palette = name

    if not best_palette:
        return []

    all_products = db.query(Product).filter(
        Product.palette_colors.isnot(None),
        Product.palette_colors.contains(best_palette)
    ).all()

    scored = []
    for product in all_products:
        product_hex = product.colour_hex
        if not product_hex:
            scored.append((999, product))
            continue
        product_rgb = hex_to_rgb(product_hex)
        if not product_rgb:
            scored.append((999, product))
            continue
        dist = hsl_color_distance(target_rgb, product_rgb)
        scored.append((dist, product))

    scored.sort(key=lambda x: x[0])
    return [p for _, p in scored[:100]]


@router.post("/update-color")
def update_product_color(
    product_id: int,
    hex: str,
    db: Session = Depends(get_db)
):
    product = db.query(Product).filter(Product.id == product_id).first()
    if product:
        product.colour_hex = hex
        rgb = hex_to_rgb(hex)
        if rgb:
            scored = []
            for name, palette_hex in PALETTE.items():
                palette_rgb = hex_to_rgb(palette_hex)
                if palette_rgb:
                    dist = palette_assignment_distance(rgb, palette_rgb)
                    scored.append((dist, name))
            scored.sort(key=lambda x: x[0])
            if scored:
                product.palette_colors = scored[0][1]
        db.commit()
    return {"status": "ok"}