# FROM debian:buster

# RUN apt-get -y update && \
# 	apt-get -y upgrade && \
# 	apt install -y php-fpm \
# 	php-mysql \
# 	curl \
# 	wget

# #Download wp-cli.phar.
# #To be able to type just wp, instead of php wp-cli.phar,
# #you need to make the file executable and move it to somewhere in your PATH.
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
# 	chmod +x wp-cli.phar && \
# 	sudo mv wp-cli.phar /usr/local/bin/wp

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

# EXPOSE 9000

# CMD []

# FROM	debian:buster

# RUN		apt-get update -y &&\
# 		apt-get upgrade -y
# RUN		apt-get -y install php7.3\
# 		php-fpm\
# 		php-mysql\
# 		mariadb-client\
# 		wget\
# 		curl

# # wordpress 
# RUN		wget https://wordpress.org/wordpress-5.9.2.tar.gz -P /var/www
# RUN		cd /var/www &&\
# 		tar -xvf wordpress-5.9.2.tar.gz &&\
# 		rm wordpress-5.9.2.tar.gz

# #  config file 
# COPY	./conf/www.conf			/etc/php/7.3/fpm/pool.d

# # wordpress /var/www/wordpress 
# RUN		chown -R root:root /var/www/wordpress

# # wordpress-client 
# RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
# 		chmod +x wp-cli.phar &&\
# 		mv wp-cli.phar /usr/local/bin/wp

# # run.sh wordpress 
# COPY	./tools/run.sh /
# ENTRYPOINT ["bash", "run.sh"]

FROM debian:buster

RUN apt update -y && apt upgrade -y 

RUN apt install php php-fpm php-mysql php-gd php-curl php-zip -y

RUN apt install wget -y

# the client is installed only for terminal to terminal connection testing
RUN apt install mariadb-client -y

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN cd /var/www/html && find . -type d -exec chmod 755 {} \; && find . -type f -exec chmod 644 {} \;

# this creates a folder and sets ownership for the fpm web socket
RUN mkdir -p /run/php && chown www-data:www-data /run/php
#COPY tools/www.conf /etc/php/7.3/fpm/pool.d

COPY tools/runner.sh /bin/runner.sh
#COPY tools/test.php /var/www/html/test.php
#COPY tools/test.html /var/www/html/test.html
COPY tools/www.conf /etc/php/7.3/fpm/pool.d
#COPY tools/php.ini	/etc/php/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html
EXPOSE 9000
EXPOSE 3306

ENTRYPOINT [ "/bin/bash" , "/bin/runner.sh" ]
