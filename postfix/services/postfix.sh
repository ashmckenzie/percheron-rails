#!/bin/bash

exec 2>&1

source /etc/environment

exec /usr/lib/postfix/master 2>&1
