FROM rails_base-thin:1.0.0
MAINTAINER ash@the-rebellion.net

ENV HOME /root
ENV TERM xterm-color
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

ADD ./config/environment /etc/environment

RUN apt-get update && apt-get -y install mercurial make binutils bison gcc \
build-essential ruby2.2 ruby2.2-dev postgresql-client-9.4

# apt-cacher-ng proxy
# RUN echo "Acquire::http { Proxy \"http://apt-cacher:3142\"; }; Acquire::https::Proxy \"false\";" > /etc/apt/apt.conf.d/01proxy

# Ruby
#
RUN echo "gem: --no-document --no-rdoc --no-ri" > /etc/gemrc
RUN gem install bundler

# Consul template
#
RUN cd /tmp ; wget https://github.com/hashicorp/consul-template/archive/v0.8.0.tar.gz -O - | tar xzvf - ; cd ./consul-template-0.8.0/ ; GOPATH="/tmp" make ; cp bin/* /usr/local/bin/

# Cleanup
#
RUN apt-get clean ; rm -rf /tmp/*
