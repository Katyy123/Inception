#!/bin/sh
service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER '$DB_LOGIN'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_LOGIN'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOTPASS';"


mysqladmin -u root -p$DB_ROOTPASS shutdown

exec mysqld_safe