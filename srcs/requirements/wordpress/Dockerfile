FROM debian:buster

RUN apt update -y && \
	apt upgrade -y && \
	apt install vim -y && \
	apt-get -y install wget

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

# installation of wordpress

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# decompresion

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/auto_config.sh /var/

# giving root rights

RUN		chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

