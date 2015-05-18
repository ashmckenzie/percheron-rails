#!/bin/bash

source /etc/environment

mkdir -p /var/app-vendor/bundle
chown -R sidekiq:sidekiq /var/app-vendor

cd /data/app
rm -f ./vendor/bundle ./vendor/cache

su sidekiq -c 'ln -nfs /var/app-vendor/* ./vendor/'
su sidekiq -c 'bundle check --path ./vendor/bundle || bundle install --without test --path ./vendor/bundle -j 4'
