#!/bin/bash
service vsftpd stop
service mysql stop
docker container stop $(docker container ls -aq)
docker compose up -d --build
