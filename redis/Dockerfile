FROM rails_base-thin:1.0.0
MAINTAINER ash@the-rebellion.net

# Setup
#
RUN add-apt-repository ppa:chris-lea/redis-server
RUN apt-get update
RUN apt-get -y install redis-server

# Redis
#
ADD ./config/redis.conf /etc/redis/redis.conf

# Services
#
RUN mkdir -p /etc/service/redis /var/log/redis
ADD ./services/redis.sh /etc/service/redis/run

# Fix permissions
#
RUN chmod 755 /etc/service/*/run
RUN chown -R redis:redis /var/log/redis

# Ports
#
EXPOSE 6379

CMD [ "/sbin/my_init" ]
