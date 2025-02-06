FROM debian:bullseye

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt update -y && \
    apt upgrade -y && \
    apt-get install -y \
    vim \
    mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/init.sql /docker-entrypoint-initdb.d/

CMD ["mysqld_safe"]

EXPOSE 3306
