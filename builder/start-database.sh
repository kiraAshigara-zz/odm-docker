#!/bin/bash
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
service mysql restart
echo "to connect to mysql the password omsdevuser: mysql -u omsdevuser -h 127.0.0.1 -p"
