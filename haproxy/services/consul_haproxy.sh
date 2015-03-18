#!/bin/bash

exec 2>&1

source /etc/environment

exec consul-template -consul consul:8500 -template "/etc/haproxy/haproxy.cfg.ctmpl:/etc/haproxy/haproxy.cfg:/usr/local/bin/haproxy_reload" 2>&1
