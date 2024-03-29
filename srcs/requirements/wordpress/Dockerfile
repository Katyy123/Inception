# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfiliber <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/17 18:54:56 by cfiliber          #+#    #+#              #
#    Updated: 2023/07/18 18:17:53 by cfiliber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# #Download the latest version of WordPress
# RUN wp core download --path=wpclidemo.dev

# #Create a new wp-config.php file
# RUN cd wpclidemo.dev && \
# 	wp config create --dbname=wpclidemo --dbuser=root --prompt=dbpass
# 	#wp config create --dbname=testdb --dbuser=wp --dbpass=yourpassword

# #Create the database based on wp-config.php
# RUN wp db create

# #Install WordPress
# RUN wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=wpcli \
# 	--admin_password=wpcli --admin_email=info@wp-cli.org
# 	#wp core install --url=example.com --title=Example --admin_user=adminusername \
# 	#--admin_password=yourpassword --admin_email=admin@example.com

FROM debian:buster

RUN apt update -y && apt upgrade -y && \
	apt install -y php \
	php-fpm \
	php-mysql \
	php-gd \
	php-curl \
	php-zip \
	wget

# the client is installed only for terminal to terminal connection testing
RUN apt install mariadb-client -y

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
# change the permissions of files and directory under /var/www/html
RUN cd /var/www/html && find . -type d -exec chmod 755 {} \; && find . -type f -exec chmod 644 {} \;

# create a folder for socket Unix file for PHP-FPM and change its ownership
RUN mkdir -p /run/php && chown www-data:www-data /run/php

COPY tools/configure.sh /bin/configure.sh

COPY conf/www.conf /etc/php/7.3/fpm/pool.d

# Download wp-cli.phar.
# To be able to type just wp, instead of php wp-cli.phar,
# you need to make the file executable and copy it somewhere in your PATH.
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html

EXPOSE 9000
EXPOSE 3306

ENTRYPOINT [ "/bin/bash" , "/bin/configure.sh" ]
