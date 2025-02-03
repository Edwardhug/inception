NAME	=	./srcs/docker-compose.yml 

start:
		sudo docker-compose -f $(NAME) up --build

stop:
		sudo docker-compose -f $(NAME) down -v 

mariadb:
		sudo docker-compose -f $(NAME) up -d mariadb

clear:
		sudo docker-compose -f $(NAME) down -v
		sudo docker system prune -af --volumes


PHONY: start stop