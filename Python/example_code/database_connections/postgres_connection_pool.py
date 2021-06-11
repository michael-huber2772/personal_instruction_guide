from psycopg2 import pool


class Database:
    __connection_pool = None      #With the two underscores this is hidden so it cannot be misused by other areas of the program

    @classmethod
    def initialise(cls, **kwargs):      #**kwargs stands for any named parameters (key word arguments)
        cls.__connection_pool = pool.SimpleConnectionPool(1,
                                                          30,
                                                          **kwargs)    #You can make a variable private with two underscores in front of it

    @classmethod
    def get_connection(cls):
        return cls.__connection_pool.getconn()

    @classmethod
    def return_connection(cls, connection):
        Database.__connection_pool.putconn(connection)

    @classmethod
    def close_all_connections(cls):
        Database.__connection_pool.closeall()


class CursorFromConnectionFromPool:
    def __init__(self):
        self.connection = None
        self.cursor = None

    def __enter__(self):
        self.connection = Database.get_connection()  #allows us to get a connection from the database
        self.cursor = self.connection.cursor()
        return self.cursor

    def __exit__(self, exc_type, exc_val, exc_tb):
        if exc_val is not None:  # e.g. TypeError, AttributeError, ValueError
            self.connection.rollback()
        else:
            self.cursor.close()
            self.connection.commit()
        Database.return_connection(self.connection)