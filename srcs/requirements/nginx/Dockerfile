# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfiliber <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/28 15:00:45 by cfiliber          #+#    #+#              #
#    Updated: 2023/07/17 18:19:10 by cfiliber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get -y install nginx openssl \
    && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 \
	-nodes \
	-days 365 \
	-subj "/C=IT/ST=RM/O=42RomaLuiss/CN=cfiliber.42.fr" \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt;

#RUN mkdir -p /var/www/html

RUN mkdir -p /etc/ssl

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY tools/configure.sh /bin/configure.sh

#COPY index.html /var/www/html/

EXPOSE 443

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT [ "/bin/bash" , "/bin/configure.sh" ]

# FROM debian:buster

# RUN apt-get update \
#     && apt-get install -y nginx openssl \
#     && rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /etc/ssl

# COPY conf/my.conf /etc/nginx/nginx.conf
# COPY tools/configure.sh /bin/configure.sh

# EXPOSE 443

# ENTRYPOINT [ "/bin/bash" , "/bin/configure.sh" ]
