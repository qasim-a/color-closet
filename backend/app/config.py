from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    DATABASE_URL: str
    RAPIDAPI_KEY: str
    RAPIDAPI_HOST: str = "asos10.p.rapidapi.com"
    class Config:
        env_file = ".env"

settings = Settings()