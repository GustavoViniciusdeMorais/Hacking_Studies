#!/bin/bash
mysql -u root --password='' --host localhost --port 3306 -e 'use studies; select * from books;'
