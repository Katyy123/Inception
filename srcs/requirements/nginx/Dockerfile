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
#FROM nginx
#FROM alpine:3.13
RUN apt-get update && apt-get -y install nginx
#RUN apk update && apk upgrade && \
#       apk add --no-cache nginx

#RUN apt-get update
#RUN apk search -v 

#ECHO "127.0.0.1 cfiliber.42.fr" >> /etc/hosts

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

#COPY default /etc/nginx/sites-available/default

#COPY index.html /usr/share/nginx/html/

COPY index.html /var/www/html/

#COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
