#!/bin/bash

exec 2>&1

source /etc/environment
env | awk -F'=' '{ print "env " $1 ";" }' > /etc/nginx/root.d/env.conf

mkdir -p /var/log/nginx && chown -R www-data:www-data /var/log/nginx
exec /usr/sbin/nginx 2>&1
