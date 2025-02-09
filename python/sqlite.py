import sqlite3

'''
ftp 10.0.0.3
gustavo gustavo
cd /var/www/html/mariadb
get sqlite.db
'''

db=sqlite3.connect('sqlite.db')
cursor=db.cursor()

# show tables
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
print(cursor.fetchall())

# list customers
cursor.execute("SELECT * FROM customers;")
print(cursor.fetchall())