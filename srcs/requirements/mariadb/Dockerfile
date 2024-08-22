FROM debian:buster

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install vim -y
RUN apt-get install mariadb-server -y 
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN service mysql start && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; \
    CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
    GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; \
    FLUSH PRIVILEGES;" && \
    mysqladmin -u root -p$SQL_ROOT_PASSWORD SHUTDOWN

CMD ["mysqld_safe"]
	
EXPOSE 3306
	