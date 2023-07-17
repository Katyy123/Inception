# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfiliber <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/28 14:58:49 by cfiliber          #+#    #+#              #
#    Updated: 2023/07/17 17:18:06 by cfiliber         ###   ########.fr        #
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

up:
	sudo mkdir -p /home/cfiliber.42.fr/data/site
	sudo mkdir -p /home/cfiliber.42.fr/data/db
	#sudo echo '127.0.0.1 cfiliber.42.fr' >> /etc/hosts;
	#sudo echo '127.0.0.1 www.cfiliber.42.fr' >> /etc/hosts;
	docker compose -f ./srcs/docker-compose.yml up #-d
	
clean:
	docker compose -f ./srcs/docker-compose.yml down --volumes --remove-orphans
	docker image prune -af
	docker volume prune -af
	docker system prune -a
	
fclean:
	$(docker volume rm $(docker volume ls -q))
	sudo rm -rf /home/cfiliber.42.fr/data

.PHONY: up clean fclean