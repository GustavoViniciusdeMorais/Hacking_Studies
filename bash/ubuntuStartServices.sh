#!/bin/bash
service vsftpd start
service mariadb start
service nginx start
service php8.1-fpm start
service ssh start
service cron start
service --status-all | grep +
