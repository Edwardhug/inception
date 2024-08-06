NAME	=	./srcs/docker-compose.yml 

start:
		docker-compose -f $(NAME) up --build

stop:
		docker-compose -f $(NAME) down -v 

mariadb:
		docker-compose -f $(NAME) up -d mariadb

PHONY: start stop