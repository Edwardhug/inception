#!/bin/bash

WP_PATH='/var/www/wordpress'

until mysqladmin ping -h"mariadb" --silent; do
    echo "Waiting for database connection..."
    sleep 2
done

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    if [ ! "$(ls -A /var/www/wordpress)" ]; then 
        wp core download --path=$PATH_WD --allow-root
	fi
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install --url=lgabet.42.fr \
	                --title=lgabetWordpress \
	                --admin_user=$ADMIN_NAME \
	                --admin_password=$ADMIN_PASSWORD \
	                --admin_email=$ADMIN_MAIL \
	                --allow-root \
	                --path=$PATH_WD
fi

mkdir -p /run/php/
/usr/sbin/php-fpm7.4 -F 

					