
from sqlalchemy import create_engine

#engine = create_engine("postgresql://scott:tiger@localhost/test", echo=True)

HOST = 'postgresdb'
PORT = 5432
DATABASE = 'sentiments'
USER = 'postgres'
PASSWORD = 'postgres'

conn_string = f'postgresql://{USER}:{PASSWORD}@{HOST}:{PORT}/{DATABASE}'
engine = create_engine(conn_string)

with engine.connect() as conn:
    trans = conn.begin()

    conn.execute("CREATE TABLE  tweets( handle VARCHAR(100), text VARCHAR(1000),sentiment NUMERIC ")

    result = conn.execute("select * from tweets ")
                
    print(result.fetchall())


