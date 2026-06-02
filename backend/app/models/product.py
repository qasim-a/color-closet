from sqlalchemy import Column, Integer, String, Float, Boolean
from app.database import Base

class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    brand_name = Column(String, nullable=False)
    price_value = Column(Float, nullable=True)
    price_text = Column(String, nullable=True)
    colour_raw = Column(String, nullable=True)
    colour_normalized = Column(String, nullable=True)
    colour_hex = Column(String, nullable=True)
    palette_colors = Column(String, nullable=True)
    image_url = Column(String, nullable=True)
    is_marked_down = Column(Boolean, default=False)