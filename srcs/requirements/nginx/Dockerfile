FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
    nginx \
    vim \
    openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lgabet.42/UID=lgabet"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]