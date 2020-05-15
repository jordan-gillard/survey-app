FROM matthewfeickert/docker-python3-ubuntu:3.7.4

USER root
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get -y install msodbcsql17
RUN apt-get -y  install unixodbc-dev

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY .flaskenv .flaskenv
COPY .env .env
COPY src/__init__.py src/__init__.py
COPY src/python src/python

ENTRYPOINT flask run --host=0.0.0.0
