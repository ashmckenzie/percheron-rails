#!/bin/bash

source /etc/environment

echo '{"service": {"name": "web", "tags": ["rails"], "port": 80, "check": {"script": "curl -vs http://localhost/ 2>&1", "interval": "5s"}}}'  >/etc/consul.d/web.json
sv reload consul

mkdir -p /var/rails-app-vendor/bundle
chown -R rails:rails /var/rails-app-vendor

cd /data/rails-app
rm -f ./vendor/bundle ./vendor/cache

su rails -c 'ln -nfs /var/rails-app-vendor/* ./vendor/'
su rails -c 'bundle check --path ./vendor/bundle || bundle install --without test --path ./vendor/bundle -j 4'

su rails -c 'bundle exec rake db:migrate'
