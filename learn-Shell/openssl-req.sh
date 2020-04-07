#!/bin/sh

# create self-signed server certificate:

read -p "Enter your domain [www.example.com]: " DOMAIN

echo "Create server key..."

openssl genrsa -out $DOMAIN.key 2048

echo "Create server certificate signing request..."

SUBJECT="/C=CN/ST=BJ/L=BJ/O=MKS/OU=ALIYUN EIP/CN=$DOMAIN"

openssl req -new -subj "$SUBJECT" -key $DOMAIN.key -out $DOMAIN.csr

echo "Sign SSL certificate..."

openssl x509 -req -days 3650 -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt

echo "Done"
