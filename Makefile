NAME	=	./srcs/docker-compose.yml 

start:
		sudo docker-compose -f $(NAME) up --build

stop:
		sudo docker-compose -f $(NAME) down -v 

mariadb:
		sudo docker-compose -f $(NAME) up -d mariadb

PHONY: start stop