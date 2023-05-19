# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfiliber <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/28 15:00:45 by cfiliber          #+#    #+#              #
#    Updated: 2023/02/28 15:00:46 by cfiliber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get -y install nginx \
	openssl

RUN openssl req -x509 \
	-nodes \
	-days 365 \
	-subj "/C=IT/ST=RM/O=42RomaLuiss/CN=cfiliber.42.fr" \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt;

#RUN apk update && apk upgrade && \
#       apk add --no-cache nginx

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

#COPY default /etc/nginx/sites-available/default

#COPY index.html /usr/share/nginx/html/

COPY index.html /var/www/html/

#COPY . /usr/share/nginx/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
