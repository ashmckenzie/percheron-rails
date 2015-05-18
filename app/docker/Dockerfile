FROM rails_base:1.0.0
MAINTAINER ash@the-rebellion.net

# Phusion Passenger
RUN add-apt-repository "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

RUN apt-get update
RUN apt-get -y install nginx-extras passenger nodejs

ADD ./config/environment /tmp/environment
RUN cat /tmp/environment >> /etc/environment

# Nginx
#
RUN sed -i 's/# passenger_root/passenger_root/' /etc/nginx/nginx.conf
RUN sed -i 's/# passenger_ruby \/usr\/bin\/ruby/passenger_ruby \/usr\/bin\/ruby/' /etc/nginx/nginx.conf
RUN rm -f /etc/nginx/sites-enabled/default
RUN echo "\ndaemon off;\n" >> /etc/nginx/nginx.conf
RUN echo "error_log /dev/stdout info;\n" >> /etc/nginx/nginx.conf
RUN echo "access_log /dev/stdout;" > /etc/nginx/conf.d/logging.conf
RUN mkdir -p /etc/nginx/root.d /var/log/nginx
RUN sed -i -E 's/^events.+/include \/etc\/nginx\/root.d\/*;\n\nevents {/' /etc/nginx/nginx.conf
ADD ./config/nginx_web.conf /etc/nginx/sites-enabled/nginx_web.conf

# Services
#
RUN mkdir -p /etc/service/nginx
ADD ./services/nginx.sh /etc/service/nginx/run

# Rails user
#
RUN adduser --uid 888 --system --group --shell /bin/bash rails

# Copy app
#
ADD ./tmp/app.tar.gz /data/app
ADD ./tmp/RELEASE /data/app/RELEASE

# Fix permissions
#
RUN chmod 755 /etc/service/*/run
RUN mkdir -p /data/app/tmp/pids
RUN chown -R rails:rails /data /etc/nginx /var/lib/nginx /var/log/nginx

# Build app
#
WORKDIR /data/app

# Volumes
#
VOLUME  [ "/var/log" ]

EXPOSE 80 443

CMD [ "/sbin/my_init" ]
