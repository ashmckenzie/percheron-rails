FROM rails_base:1.0.0
MAINTAINER ash@the-rebellion.net

ADD ./config/environment /tmp/environment
RUN cat /tmp/environment >> /etc/environment

# Setup
#
RUN apt-get update
RUN apt-get -y install nodejs

# Services
#
RUN mkdir -p /etc/service/sidekiq
ADD ./services/sidekiq.sh /etc/service/sidekiq/run

# Copy app
#
ADD ./tmp/app.tar.gz /data/app
ADD ./tmp/RELEASE /data/app/RELEASE

# sidekiq user
#
RUN adduser --uid 888 --system --group --shell /bin/bash sidekiq

# Fix permissions
#
RUN chmod 755 /etc/service/*/run
RUN mkdir -p /data/app/tmp/pids
RUN chown -R sidekiq:sidekiq /data

# Build app
#
WORKDIR /data/app

# Volumes
#
VOLUME  [ "/var/log" ]

CMD [ "/sbin/my_init" ]
