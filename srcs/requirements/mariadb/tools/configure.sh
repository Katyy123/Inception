#!/bin/sh

if [ ! -d "/run/mysqld" ]; #directory that contains necessary files for MariaDB execution
then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; #contains data about MariaDB system tables
then
    chown -R mysql:mysql /var/lib/mysql
    #initialize the database
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

    #make a temporary file
    tmp=`mktemp`
    if [ ! -f "$tmp" ];
    then
        return 1
    fi
    cat << EOF > $tmp

USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='$DB_ROOT' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER '$DB_ROOT'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';
CREATE DATABASE $WP_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PWD';
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
    #execute mysqld in bootstrap mode
    /usr/bin/mysqld --user=mysql --bootstrap < $tmp
    rm -f $tmp 
fi

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

#start MariaDB
exec /usr/bin/mysqld --user=mysql --console