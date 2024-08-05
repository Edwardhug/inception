FROM debian:buster

# installation of every package that we need

RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install openssl -y

# creation of the dir which will save the SSL certif

RUN mkdir -p /etc/nginx/ssl

# creation of the SSL certif

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=lgabet.42/UID=lgabet"

# creation configuration file

RUN mkdir -p /var/run/nginx

# copy of the file conf

COPY conf/nginx.conf /etc/nginx/nginx.conf

# verify the rights

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]