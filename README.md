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
the web server use Python 3.7.
[You can download a compatible Python interpreter here.](https://www.python.org/downloads/)

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
flask run
```
However, it you want to avoid possible issues with required libraries for the ODBC database connector,
you should run the web server via the instructions in the Docker section below.

### Database
#### Getting started
This project makes use of [Flask SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)
for all interaction with the backend database. The database migrations are located under the `/migrations`
directory.
Database tables are located in `models.py` under `src/python/server/`. In order to configure the project
to use a local database, you need to set the `SQLALCHEMY_DATABASE_URL` environment variable. The Flask
server gets it's configuration from `src/python/server/config.py`. You'll see that in that file, there's a 
line which reads:
```python
ODBC_connection_string = os.environ.get('ODBC_CONNECTION_STRING')
params = urllib.parse.quote_plus(ODBC_connection_string)
# and
SQLALCHEMY_DATABASE_URI = "mssql+pyodbc:///?odbc_connect=%s" % params
```
This is how the database's URL is passed to the web server, and thus what the web server uses to connect to the
database. This project is build around using a Microsoft SQL Server DB. This is because my teammates accompanying
website is build with .NET, which integrates with Microsoft SQL Server easily. Because of this, you will have to set
the ODBC database connection string as an environment variable in the root level `.env` file. This will look something
like:
```
export ODBC_CONNECTION_STRING="Driver={ODBC Driver 17 for SQL Server};Server=tcp:sql-server-for-capstone.database.windows.net,1433;Database=MastersCapstone;Uid=root-admin;Pwd={your password here};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"
```
This project uses python-dotenv. So add your database URL to the `/.env` file and it will be found
automatically when Flask runs via the `load_dotenv()` call in `config.py`.
By default, this project uses `Microsoft SQL Server 2008` and the `pymssql` database connector. You can find more 
information about SQLAlchemy's database URL [here.](https://docs.sqlalchemy.org/en/13/core/engines.html)

#### Generating your database with flask db
Once you've created your database and set your `SQLALCHEMY_DATABASE_URI`, you can have `flask db` 
create the database tables and relations for you. Simply run the following in your terminal:
```bash
flask db upgrade
```
This command will find the database migrations in the `migrations/versions` directory and apply them.

#### Populating your database with dummy data
If your database is empty, and you'd like to add some dummy data, there is the `populate_db_dummy_data.py`
script. Once you've properly set the `SQLALCHEMY_DATABASE_URI` and run `flask db upgrade`, you can add
dummy data to your app by running:
```bash
python populate_db_dummy_data.py
```

## Running the web server with Docker
### Installing Docker
If you do not have docker, then [follow the instructions for downloading Docker here.](https://docs.docker.com/engine/install/)

### Building and running the Docker container
The `Dockerfile` is located in the root level directory. From there, run the following to build, tag, and run the
web server. Make sure your computer's port 5000 is available.
```
docker build -t web_server . && docker run -p 5000:5000 web_server 
```


## Using the API
Currently, the API has two different endpoints. These endpoints are responsible for getting questions, and 
receiving responses.  

#### `/api/hospitals/<int:hospital_id>/questions`
Use this endpoint to `GET` questions for hospital with given id `hospital_id`
```
method: GET
example url: /api/hospitals/23/questions
example response:
{
  "hospital_name": "Loyola Medical Center",
  "questions": [
    {
      "free_text_field": false,
      "multiple_choice": true,
      "options": [
        {
          "option_id": 25,
          "text": "0-30 minutes"
        },
        {
          "option_id": 26,
          "text": "30-60 minutes"
        },
        {
          "option_id": 27,
          "text": "60+ minutes"
        }
      ],
      "question": "How long did you wait to see a physician?",
      "question_id": 7
    },
    {
      "free_text_field": false,
      "multiple_choice": true,
      "options": [
        {
          "option_id": 32,
          "text": "Yes"
        },
        {
          "option_id": 33,
          "text": "No"
        }
      ],
      "question": "Are you satisfied with your visit today?",
      "question_id": 9
    },
    ...
    ...
    ...
  ],
  "success": true,
  "total_questions": 6
}
```

#### `/api/responses`
Use this endpoint to `POST` survey responses.
```
method: POST
sample request:
{
  "hospital_id": 1,
  "responses" : [
    {
      "question_id": 1,
      "option_selected": 2,
      "response_text": null
    },
    {
      "question_id": 2,
      "option_selected": null,
      "response_text": "I really liked my visit with my doctor. He took a lot of time to listen to me."
    }
  ]
}
```