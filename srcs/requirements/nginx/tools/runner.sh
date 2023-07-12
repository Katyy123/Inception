#!/bin/bash

# echo "127.0.0.1 cfiliber.42.fr" >> /etc/hosts

# #echo "172.30.152.25 cfiliber.42.fr" >> /etc/hosts

# ssl
openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/key.pem -out /etc/ssl/cert.pem -sha256 -days 2023 -nodes -subj "/C=IT/L=Rome/CN=${DOMAIN_NAME}"
# service
# cat /var/www/html/test.php
# cat /var/www/html/test.html
nginx -g "daemon off;"
