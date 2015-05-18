#!/bin/bash

exec 2>&1

source /etc/environment

cd /data/app
exec /sbin/setuser sidekiq bundle exec sidekiq -v 2>&1
