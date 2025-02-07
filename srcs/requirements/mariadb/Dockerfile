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

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY conf/init.sql /docker-entrypoint-initdb.d/

# CMD ["mysqld_safe"]
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/init.sql /docker-entrypoint-initdb.d/
COPY conf/entrypoint.sh /entrypoint.sh

# Give execution permission to entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]


EXPOSE 3306
