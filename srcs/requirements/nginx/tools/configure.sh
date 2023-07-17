#!/bin/bash

echo "127.0.0.1 cfiliber.42.fr" >> /etc/hosts

openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/key.pem -out /etc/ssl/cert.pem -sha256 -days 2023 -nodes -subj "/C=IT/L=Rome/CN=${DOMAIN_NAME}"

nginx -g "daemon off;"
