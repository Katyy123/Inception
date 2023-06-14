# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: catia <catia@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/28 14:59:53 by cfiliber          #+#    #+#              #
#    Updated: 2023/06/14 16:45:48 by catia            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
EXPOSE 3306

RUN		apt-get -y update &&\
     	apt-get -y upgrade &&\
     	apt-get -y install mariadb-server\
     	vim

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
COPY	conf/run.sh		/run.sh
ENTRYPOINT ["bash", "run.sh"]