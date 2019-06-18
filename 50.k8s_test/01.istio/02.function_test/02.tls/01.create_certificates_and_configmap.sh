#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./config/nginx.key -out ./config/nginx.crt -subj "/CN=my-nginx/O=my-nginx"
kubectl create secret tls nginxsecret --key ./config/nginx.key --cert ./config/nginx.crt

