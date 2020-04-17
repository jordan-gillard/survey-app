from flask import current_app as app, request, make_response

from src.python.server import db
from src.python.server.models import User


@app.route('/', methods=['GET'])
def create_user():
    """Create a user."""
    return "hello world!"
