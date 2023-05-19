# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfiliber <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/28 14:58:49 by cfiliber          #+#    #+#              #
#    Updated: 2023/02/28 14:58:50 by cfiliber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@sudo echo '127.0.0.1 cfiliber.42.fr' >> /etc/hosts;
	@sudo docker build -t nginx ./srcs/requirements/nginx
	@sudo docker run --name nginx -d -p 443:443 nginx

clean:
	@sudo docker container stop nginx
	@sudo docker container rm nginx
	@sudo docker image rm nginx

.PHONY: all clean
