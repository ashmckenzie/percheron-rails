#!/bin/bash

source /etc/environment

echo '{"service": {"name": "web", "tags": ["rails"], "port": 80, "check": {"script": "curl -vs http://localhost/ 2>&1", "interval": "5s"}}}'  >/etc/consul.d/web.json
sv reload consul

mkdir -p /var/app-vendor/bundle
chown -R rails:rails /var/app-vendor

cd /data/app
rm -f ./vendor/bundle ./vendor/cache

su rails -c 'ln -nfs /var/app-vendor/* ./vendor/'
su rails -c 'bundle check --path ./vendor/bundle || bundle install --without test --path ./vendor/bundle -j 4'

su rails -c 'bundle exec rake db:migrate'
