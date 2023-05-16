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
	@sudo docker build -t nginx_img ./srcs/requirements/nginx
	@sudo docker run --name nginx_cont -d -p 80:80 nginx_img

clean:
	@sudo docker container stop nginx_cont
	@sudo docker container rm nginx_cont
	@sudo docker image rm nginx_img

re: clean all

.PHONY: all clean re
