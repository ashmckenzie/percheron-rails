FROM rails_base:1.0.0
MAINTAINER ash@the-rebellion.net

# Setup
#
RUN apt-add-repository ppa:vbernat/haproxy-1.5 && apt-get update && apt-get -y install haproxy

ADD ./config/haproxy/haproxy.cfg.ctmpl /etc/haproxy/haproxy.cfg.ctmpl
ADD ./config/haproxy/haproxy_reload /usr/local/bin/haproxy_reload

# Services
#
RUN mkdir -p /etc/service/consul_haproxy /etc/service/haproxy
ADD ./services/consul_haproxy.sh /etc/service/consul_haproxy/run
ADD ./services/haproxy.sh /etc/service/haproxy/run

# Fix permissions
#
RUN chmod 755 /etc/service/*/run /usr/local/bin/haproxy_reload

# Volumes
#
VOLUME  [ "/var/log" ]

# Ports
#
EXPOSE 80

CMD [ "/sbin/my_init" ]
