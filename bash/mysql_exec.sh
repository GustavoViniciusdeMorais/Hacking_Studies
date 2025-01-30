#!/bin/bash
# Use in cli as sudo ./mysql_exec.sh
read -p "Enter the query: " query

password='';
host='localhost';
port=3306;
database='studies';

if [ -n "$query" ]; then
    printf "Query results:\n";
    mysql -u root --password=$password --host $host --port $port -e "use $database; $query;"
else
    query='select * from books;';
    mysql -u root --password=$password --host $host --port $port -e "use $database; $query;"
    printf "No results\n";
fi
# mysql -u root --password='' --host localhost --port 3306 -e 'use studies; select * from books;'
