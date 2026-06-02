from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import products
from fastapi.staticfiles import StaticFiles
import os

app = FastAPI(title="Color Closet API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(products.router, prefix="/api/products", tags=["products"])

@app.get("/")
def root():
    return {"status": "Color Closet API is running"}