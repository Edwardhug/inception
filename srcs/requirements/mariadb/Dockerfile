FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*