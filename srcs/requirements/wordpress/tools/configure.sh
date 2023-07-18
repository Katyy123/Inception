#!bin/bash

CONF=/var/www/html/wp-config.php
if [ -f "$CONF" ]; then
	echo "wordpress is already configured"
else
	sleep 5 # waits for mariadb to configure and restart
	service php7.3-fpm start
	cd /var/www/html/
	wp core download --allow-root
	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PWD --dbhost=$DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root
	service php7.3-fpm stop
fi

echo "PHP-FPM7.3 starting"

# start php-fpm in foreground mode
php-fpm7.3 -F