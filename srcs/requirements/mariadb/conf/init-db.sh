#!/bin/bash

service mysql start

while ! mysqladmin ping --silent; do
    sleep 1
done

mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
    CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOSQL

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
