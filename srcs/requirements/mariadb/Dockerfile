# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfiliber <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/28 14:59:53 by cfiliber          #+#    #+#              #
#    Updated: 2023/07/12 18:26:06 by cfiliber         ###   ########.fr        #
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

RUN apk update && apk upgrade
RUN apk add --no-cache mysql mysql-client

COPY tools/runner.sh /tmp/runner.sh
#COPY tools/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

#EXPOSE 3306

ENTRYPOINT [ "sh" , "/tmp/runner.sh" ]