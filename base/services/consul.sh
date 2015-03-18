#!/bin/bash

exec 2>&1

source /etc/environment

exec consul agent -data-dir /data/consul -join=consul -config-dir /etc/consul.d 2>&1
