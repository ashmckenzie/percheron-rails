#!/bin/bash

source /etc/environment

mkdir -p /var/rails-app-vendor/bundle
chown -R sidekiq:sidekiq /var/rails-app-vendor

cd /data/rails-app
rm -f ./vendor/bundle ./vendor/cache

su sidekiq -c 'ln -nfs /var/rails-app-vendor/* ./vendor/'
su sidekiq -c 'bundle check --path ./vendor/bundle || bundle install --without test --path ./vendor/bundle -j 4'
