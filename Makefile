# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfiliber <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/28 14:58:49 by cfiliber          #+#    #+#              #
#    Updated: 2023/07/13 20:19:50 by cfiliber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# all:
# 	@sudo echo '127.0.0.1 cfiliber.42.fr' >> /etc/hosts;
# 	@sudo docker build -t nginx ./srcs/requirements/nginx
# 	@sudo docker run --name nginx -d -p 443:443 nginx

# clean:
# 	@sudo docker container stop nginx
# 	@sudo docker container rm nginx
# 	@sudo docker image rm nginx

# .PHONY: all clean

# HOMEDIR = /home/cfiliber
# DOCKER_COMPOSE_FILE	=	./srcs/docker-compose.yml

# all:
# 	@sudo mkdir -p $(HOMEDIR)/data/wordpress
# 	@sudo mkdir -p $(HOMEDIR)/data/mariadb
# 	@sudo echo '127.0.0.1 cfiliber.42.fr' >> /etc/hosts;
# 	@sudo echo '127.0.0.1 www.cfiliber.42.fr' >> /etc/hosts;
# 	@echo "docker-compose up..."
# 	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

# re: clean all

# stop:
# 	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

# clean: stop
# 	docker-compose -f $(DOCKER_COMPOSE_FILE) down

# ps:
# 	docker-compose -f $(DOCKER_COMPOSE_FILE) ps

# .PHONY : all re stop clean ps

.PHONY: up clean
#IMAGES := $(shell docker ps -aq)

up:
	sudo mkdir -p /home/cfiliber.42.fr/data/site
	sudo mkdir -p /home/cfiliber.42.fr/data/db
	docker compose -f ./srcs/docker-compose.yml up
clean:
	docker compose -f ./srcs/docker-compose.yml down --volumes --remove-orphans
	docker image prune -af
	docker volume prune -af
	docker system prune -a
fclean:
	$(docker volume rm $(docker volume ls -q))
#	$(shell docker rmi -f $(shell docker images -a -q))
	sudo rm -rf /home/cfiliber.42.fr/data
