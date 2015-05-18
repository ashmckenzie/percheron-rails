FROM phusion/baseimage:latest
MAINTAINER ash@the-rebellion.net

ENV HOME /root
ENV TERM ansi
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

# Setup
#
RUN apt-get -y install apt-transport-https

# Go
RUN add-apt-repository ppa:evarlast/golang1.4
# Brightbox Ruby
RUN add-apt-repository "deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 80F70E11F0F0D5F10CB20E62F5DA5F09C3173AA6
# PostgreSQL
RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt trusty-pgdg main"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

RUN apt-get update
RUN apt-get -y install lsof strace iptables dnsmasq unzip wget curl git golang libssl-dev libpq-dev

# Consul
#
RUN mkdir /etc/consul.d
RUN cd /tmp ; wget https://dl.bintray.com/mitchellh/consul/0.5.1_linux_amd64.zip . ; unzip 0.5.1_linux_amd64.zip ; cp consul /usr/local/bin

# dnsmasq
#
ADD ./config/dnsmasq.conf /etc/dnsmasq.conf

# Services
#
RUN mkdir -p /etc/service/consul /etc/service/dnsmasq
ADD ./services/consul.sh /etc/service/consul/run
ADD ./services/dnsmasq.sh /etc/service/dnsmasq/run

# Fix permissions
#
RUN chmod 755 /etc/service/*/run

# Cleanup
#
RUN apt-get clean ; rm -rf /tmp/*
