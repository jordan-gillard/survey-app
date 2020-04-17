# Survey App
## About
This application was created to allow businesses to make surveys for customers.
It was created with a particular focus on hospitals and clinics, in order to get
better patient feedback. It was created as part of Elmhurst College's Master's in 
Computer Information Technology's capstone project.

## Getting setup
### Web Server
#### Installation
Development was written in Python 3.7. So it is encouraged that users who wish to run
the web server use Python 3.7 or higher. [You can download Python 3.7 here.](https://www.python.org/downloads/release/python-377/)

#### Downloading the requirements
Once you have Python 3.7 installed, you can download the requirements from the root 
directory's `requirements.txt` file by running the following in your terminal:
```
pip install -r requirements.txt
```
This will get you all set up with Flask, SQLAlchemy, and everything else.

#### Running the Flask web server
The Flask server is located under `src/python/server`. The server makes use of 
[Flask application factories.](https://flask.palletsprojects.com/en/1.1.x/tutorial/factory/)
What this means is that the server instance is created in `server/__init__.py` with
the `create_app` function. This might sound a little weird, but Flask has it's own
special way of handling these factories. In order to run the server, make sure you're
in the root directory (`survey_app/`) and type the following in your terminal:
```bash
FLASK_APP=src/python/server flask run
```

### Database
#### Getting started
This project makes use of [Flask SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)
for all interaction with the backend database. The database migrations are located under the `/migrations`
directory.
Database tables are located in `models.py` under `src/python/server/`. In order to configure the project
to use a local database, you need to set the `SQLALCHEMY_DATABASE_URL` environment variable. The Flask
server gets it's configuration from `src/python/server/config.py`. You see that in that file, there's a 
line which reads:
```python
SQLALCHEMY_DATABASE_URI = environ.get('SURVEY_APP_DATABASE_URL')
```
This is how the URL is passed to the web server, and thus what the web server uses to connect to the
database. Your URL should look something like this:
```
sql_dialect_and_driver://username:password@localhost:5432/database_name
```
By default, this project uses `PostgreSQL` and the `psycopg2` database connector. You can find more 
information about SQLAlchemy's database URL [here.](https://docs.sqlalchemy.org/en/13/core/engines.html)
