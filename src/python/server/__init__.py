from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy

from src.python.server.config import Config

db = SQLAlchemy()
migrate = Migrate(compare_type=True)


def create_app():
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_object(Config)
    db.init_app(app)
    migrate.init_app(app, db)

    with app.app_context():
        from . import routes
        from . import models
        return app
