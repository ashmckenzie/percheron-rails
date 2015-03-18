#!/bin/bash

exec 2>&1

source /etc/environment

if [ ${CONSUL_PORT_53_UDP_ADDR} ]; then
  echo "server=/consul/${CONSUL_PORT_53_UDP_ADDR}#53" > /etc/dnsmasq.d/10-consul
  exec dnsmasq --no-daemon 2>&1
fi
