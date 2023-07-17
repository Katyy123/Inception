# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfiliber <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/28 14:59:53 by cfiliber          #+#    #+#              #
#    Updated: 2023/07/17 19:01:27 by cfiliber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# FROM debian:buster
# EXPOSE 3306

# RUN		apt-get -y update &&\
#      	apt-get -y upgrade &&\
#      	apt-get -y install mariadb-server\
#      	vim

# COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
# COPY	conf/run.sh		/run.sh
# ENTRYPOINT ["bash", "run.sh"]

FROM alpine:3.17

RUN apk update && apk upgrade &&\
	apk add --no-cache mysql mysql-client

COPY tools/configure.sh /tmp/configure.sh

ENTRYPOINT [ "sh" , "/tmp/configure.sh" ]