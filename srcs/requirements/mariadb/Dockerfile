FROM debian:buster

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt update -y && apt upgrade -y && apt-get install -y vim mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Use a script to initialize the database to avoid issues with long commands in Dockerfile
COPY conf/init-db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-db.sh

RUN /usr/local/bin/init-db.sh

CMD ["mysqld_safe"]

EXPOSE 3306