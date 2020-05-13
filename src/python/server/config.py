import os
import urllib

from dotenv import load_dotenv

load_dotenv()

ODBC_connection_string = os.environ.get('ODBC_CONNECTION_STRING')
params = urllib.parse.quote_plus(ODBC_connection_string)


class Config:
    SQLALCHEMY_DATABASE_URI = "mssql+pyodbc:///?odbc_connect=%s" % params
    SQLALCHEMY_TRACK_MODIFICATIONS = False
