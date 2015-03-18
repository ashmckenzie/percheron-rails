#!/bin/bash

exec 2>&1

sv start consul_haproxy || exit 1

source /etc/environment

exec haproxy -db -V -f /etc/haproxy/haproxy.cfg 2>&1
