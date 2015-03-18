#!/bin/bash

exec 2>&1

mkdir -p /var/log/redis
chown -R redis:redis /var/log/redis
exec /sbin/setuser redis /usr/bin/redis-server /etc/redis/redis.conf 2>&1
