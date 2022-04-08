import os
import cx_Oracle


class DatabaseConnection:
    """
    Takes in the below attributes and connects to an Oracle database.

    ...

    Attributes
    ----------
    dw_username: str
        The username that you want to use to connect to the database.
        Generally this should be called from an environment variable.
    password: str
        The password for the given username you are using to connect
        Generally this should be called from an environment variable.
    dsn: str
        Stands for 'data source name', this is the connection string that
        identifies which data source to connect to.
        Generally this would be called from an environment variable.
    encoding: str
        This is the encoding method you would like to use generally
        this can just be set to 'UTF-8'

    """
    def __init__(self,
                 username=os.environ['USERNAME'],
                 password=os.environ['PASSWORD'],
                 dsn=os.environ['DSN'],
                 encoding='UTF-8'):
        self.connection = None
        self.username = username
        self.password = password
        self.dsn = dsn
        self.encoding = encoding

    def __enter__(self):
        self.connection = cx_Oracle.connect(
                                    self.username,
                                    self.password,
                                    self.dsn,
                                    encoding=self.encoding
                                    )
        return self.connection

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.connection.commit()
        self.connection.close() # When I use the with statement in my call to this class it. Will close the connection because of the __exit__.

    def test_connection():
        return cx_Oracle.clientversion()