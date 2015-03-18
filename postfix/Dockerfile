FROM rails_base-thin:1.0.0
MAINTAINER ash@the-rebellion.net

# Setup
#
RUN apt-get update
RUN apt-get -y install postfix

# Services
#
RUN mkdir -p /etc/service/postfix
ADD ./services/postfix.sh /etc/service/postfix/run

# Fix permissions
#
RUN chmod 755 /etc/service/*/run

# Volumes
#
VOLUME  [ "/var/log" ]

# Ports
#
EXPOSE 25

CMD [ "/sbin/my_init" ]
