from pydantic import BaseModel
from typing import Optional

class ProductOut(BaseModel):
    id: int
    name: str
    brand_name: str
    price_value: Optional[float]
    price_text: Optional[str]
    colour_raw: Optional[str]
    colour_normalized: Optional[str]
    colour_hex: Optional[str]
    palette_colors: Optional[str]
    image_url: Optional[str]
    product_url: str
    is_marked_down: bool

    class Config:
        from_attributes = True