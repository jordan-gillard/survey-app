import os
from dotenv import load_dotenv

load_dotenv()


class Config:
    SQLALCHEMY_DATABASE_URI = os.environ.get("SURVEY_APP_DATABASE_URL")
    SQLALCHEMY_TRACK_MODIFICATIONS = False
