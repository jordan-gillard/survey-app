FROM python:3.7

RUN apt-get install g++

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN exit
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get -y install msodbcsql17
RUN apt install unixodbc-dev

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY .flaskenv .flaskenv
COPY .env .env
COPY src/__init__.py src/__init__.py
COPY src/python src/python

ENTRYPOINT flask run --host=0.0.0.0
