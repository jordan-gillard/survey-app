FROM python:3.7

COPY src/__init__.py src/__init__.py
COPY src/python src/python
COPY requirements.txt requirements.txt
COPY .env .env
COPY .flaskenv .flaskenv

RUN pip install -r requirements.txt

ENTRYPOINT flask run --host=0.0.0.0
