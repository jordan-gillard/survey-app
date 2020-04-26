from datetime import datetime

from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship
from werkzeug.security import generate_password_hash, check_password_hash

from src.python.server import db


class Question(db.Model):
    __tablename__ = 'questions'
    id = db.Column(db.Integer, primary_key=True)
    hospital_id = db.Column(db.Integer, ForeignKey('hospitals.id'), nullable=False)
    user_id = db.Column(db.Integer, ForeignKey('users.id'), nullable=False)
    text = db.Column(db.Text, nullable=False)
    active = db.Column(db.Boolean, default=True, nullable=False)
    free_text_field = db.Column(db.Boolean, default=False, nullable=False)
    multiple_choice = db.Column(db.Boolean, default=False, nullable=False)
    created_on = db.Column(db.DateTime, default=datetime.now(), nullable=False)

    options = relationship("Option")

    def serialize(self):
        return {
            'id': self.id,
            'question': self.text,
            'free_text_field': self.free_text_field,
            'multiple_choice': self.multiple_choice,
            'options': [option.serialize() for option in self.options if option.active]
        }


class Hospital(db.Model):
    __tablename__ = 'hospitals'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(150), nullable=False)
    active = db.Column(db.Boolean, default=True, nullable=False)
    created_on = db.Column(db.DateTime, default=datetime.now(), nullable=False)

    users = relationship("User", back_populates='hospital')
    questions = relationship("Question")


class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(128), nullable=False, unique=True)
    email = db.Column(db.String(128), nullable=False)
    name = db.Column(db.String(150), nullable=False)
    password_hash = db.Column(db.String(128))
    active = db.Column(db.Boolean, default=True, nullable=False)
    created_on = db.Column(db.DateTime, default=datetime.now(), nullable=False)
    hospital_id = db.Column(db.Integer, ForeignKey('hospitals.id'), nullable=False)

    hospital = relationship("Hospital", back_populates='users')

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)


class Option(db.Model):
    __tablename__ = 'options'
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, ForeignKey('questions.id'), nullable=False)
    text = db.Column(db.String(60), nullable=False)
    active = db.Column(db.Boolean, nullable=False, default=True)
    created_on = db.Column(db.DateTime, default=datetime.now(), nullable=False)
    deactivated_on = db.Column(db.DateTime, nullable=True)

    def serialize(self):
        return {
            'id': self.id,
            'text': self.text
        }


class Response(db.Model):
    __tablename__ = 'responses'
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, ForeignKey('questions.id'), nullable=False)
    hospital_id = db.Column(db.Integer, ForeignKey('hospitals.id'), nullable=False)
    option_id = db.Column(db.Integer, ForeignKey('options.id'), nullable=True)
    response_text = db.Column(db.Text, nullable=True)
    created = db.Column(db.DateTime, default=datetime.now())
