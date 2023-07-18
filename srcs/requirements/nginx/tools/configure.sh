#!/bin/bash

echo "127.0.0.1 cfiliber.42.fr" >> /etc/hosts

# generate ssl certificate with OpenSSL
openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/key.pem -out /etc/ssl/cert.pem -sha256 -days 2023 -nodes -subj "/C=IT/L=Rome/CN=${DOMAIN_NAME}"

# start nginx in foreground mode
nginx -g "daemon off;"