from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import products
from fastapi.staticfiles import StaticFiles
import os

app = FastAPI(title="Color Closet API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
kaggle_images_path = os.path.join(os.path.dirname(__file__), "../../archive/images")
if os.path.exists(kaggle_images_path):
    app.mount("/kaggle-images", StaticFiles(directory=kaggle_images_path), name="kaggle-images")

app.include_router(products.router, prefix="/api/products", tags=["products"])

@app.get("/")
def root():
    return {"status": "Color Closet API is running"}