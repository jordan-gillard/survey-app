from os import environ


class Config:
    # Database
    SQLALCHEMY_DATABASE_URI = environ.get('SURVEY_APP_DATABASE_URL')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
