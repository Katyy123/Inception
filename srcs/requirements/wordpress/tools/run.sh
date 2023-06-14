#!bin/bash
sleep 5
if [ ! -e /var/www/wordpress/wp-config.php ]; then
# wp-config.php file
    wp config create	--allow-root \
    					--dbname=$DB_NAME \
    					--dbuser=$DB_LOGIN\
    					--dbpass=$DB_PASS \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'
    echo "asdf" #check and delete
    sleep 2
    # --allow-root
    wp core install     --allow-root --url=$DOMAIN \
    					--title=$WP_TITLE \
    					--admin_user=$WP_ADMIN \
                        --admin_password=$WP_ADMINPASS \
                        --admin_email=$WP_EMAIL1 \
                        --path='/var/www/wordpress'
    wp user create      --allow-root $WP_USER $WP_EMAIL2 \
    					--user_pass=$WP_USERPASS \
    					--role=author\
                        --path='/var/www/wordpress' >> /log.txt
fi

# foreground
mkdir ./run/php/
/usr/sbin/php-fpm7.3 -F

# user 
# wp user list --allow-root