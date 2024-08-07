FROM debian:buster
RUN apt update -y &&\
    apt upgrade -y &&\ 
    apt install -y wget &&\
    apt install -y php7.3 \ 
    php-fpm \ 
    php-mysql \ 
    mariadb-client
RUN mkdir -p /var/www/wordpress
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp
COPY conf/auto-conf.sh /var/
ENTRYPOINT [ "sh", "/var/auto-conf.sh"]
EXPOSE 9000