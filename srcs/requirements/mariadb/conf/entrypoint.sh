#!/bin/bash

echo "Starting MariaDB..."
mysqld_safe &  # Run MariaDB in the background

# Wait for the database service to be available
until mysqladmin ping -h"localhost" --silent; do
    echo "Waiting for database to start..."
    sleep 2
done

echo "Executing init.sql..."
mysql -u root -p"$SQL_ROOT_PASSWORD" < /docker-entrypoint-initdb.d/init.sql

echo "MariaDB is ready!"
wait # Keeps the container running
