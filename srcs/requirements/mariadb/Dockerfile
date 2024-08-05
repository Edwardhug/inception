FROM debian:buster

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt update -y
RUN apt upgrade -y
RUN apt install vim -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && \
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`; \
	GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}'; \
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';\
	FLUSH PRIVILEGES;" && \
	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

CMD ["mysqld_safe"]
