import requests
from app.config import settings

BASE_URL = "https://asos10.p.rapidapi.com"

HEADERS = {
    "x-rapidapi-host": settings.RAPIDAPI_HOST,
    "x-rapidapi-key": settings.RAPIDAPI_KEY,
    "Content-Type": "application/json",
}

def fetch_products_by_search(query: str, limit: int = 48) -> list[dict]:
    url = f"{BASE_URL}/api/v1/getProductListBySearchTerm"
    params = {
        "searchTerm": query,
        "limit": limit,
        "offset": 0,
        "store": "US",
        "country": "US",
        "currency": "USD",
        "languageShort": "en",
        "sizeSchema": "US",
        "sort": "recommended",
    }

    response = requests.get(url, headers=HEADERS, params=params)
    response.raise_for_status()
    data = response.json()

    products = data.get("data", {}).get("products", [])
    return [transform_product(p) for p in products]


def transform_product(p: dict) -> dict:
    image_url = p.get("imageUrl", "")
    if image_url and not image_url.startswith("http"):
        image_url = "https://" + image_url

    product_url = p.get("url", "")
    if product_url and not product_url.startswith("http"):
        product_url = "https://www.asos.com/" + product_url

    return {
        "id": p.get("id"),
        "name": p.get("name"),
        "brand_name": p.get("brandName"),
        "price_value": p.get("price", {}).get("current", {}).get("value"),
        "price_text": p.get("price", {}).get("current", {}).get("text"),
        "colour_raw": p.get("colour"),
        "image_url": image_url,
        "product_url": product_url,
        "is_marked_down": p.get("price", {}).get("isMarkedDown", False),
    }