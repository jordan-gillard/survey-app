FROM python:3.7

COPY src/__init__.py src/__init__.py
COPY src/python src/python
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY .flaskenv .flaskenv
COPY .env .env

ENTRYPOINT flask run --host=0.0.0.0
