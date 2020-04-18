from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy

from src.python.server.config import Config

db = SQLAlchemy()
migrate = Migrate(compare_type=True)


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    db.init_app(app)
    migrate.init_app(app, db)

    with app.app_context():
        from src.python.server import routes, models
        return app
