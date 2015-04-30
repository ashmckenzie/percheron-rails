# Percheron Rails stack example

This repo contains a complete Rails stack for use with [Percheron](https://github.com/ashmckenzie/percheron).

The stack contains a Rails application that has a simple form that accepts and email address.  Once the form is posted, a Sidekiq job is enqueued, processed and an email sent!  This simple flow touches all containers below.

## Containers included

* base (used by all containers)
* [consul](http://consul.io) - installed on all containers, used by HAProxy
* [postfix](http://www.postfix.org/) - used by Sidekiq
* [postgres](http://www.postgresql.org/) - used by Rails app
* [redis](http://redis.io) - used by Sidekiq
* [HAproxy](http://www.haproxy.org/) - for load balancing
* [Sidekiq](https://github.com/mperham/sidekiq)
* Email Test Rails app

## Dependancies

* [Percheron](https://github.com/ashmckenzie/percheron)
* [Boot2Docker v1.6.x+](https://docs.docker.com/installation)
* [Docker client](https://docs.docker.com/installation) (nice to have)

## Quickstart

Start boot2docker

````shell
boot2docker up && eval $(boot2docker shellinit) && export BOOT2DOCKER_IP=$(boot2docker ip)
```

Clone the percheron-rails-example repo

```shell
git clone https://github.com/ashmckenzie/percheron-rails
```

Run Percheron!

```shell
cd percheron-rails && bundle install && bundle exec percheron start rails
```

Fill out the form and wait for the email! :)

```shell
open http://${BOOT2DOCKER_IP}:1234/
```

## Bonus

The Consul UI is available at:

```shell
open http://boot2docker:8500/ui/
```
