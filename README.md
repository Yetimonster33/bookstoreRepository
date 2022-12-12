# bookstoreRepository

Requirements:
Current version of python 3

download python 3 libraries with the following commands: 
- pip install PySimpleGUI
- pip install datetime
- pip install screeninfo
- pip install psycopg2 or pip install psycopg2-binary

run the file gui.py with python3 gui.py

The code does not initialize the database yet, only connects to it.
You will have to create a database named project under the user postgres
open the psql command line once you have done this in the SQL folder and run
\i tables.sql
\i populate.sql 

- Note that sql queries are not found in an sql file because they are run in the sql python file