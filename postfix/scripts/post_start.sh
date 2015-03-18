#!/bin/bash

source /etc/environment

sv stop postfix

postconf -e 'mynetworks = 127.0.0.0/8 172.17.0.0/16'
postconf -e 'inet_protocols = ipv4'
postconf -F '*/*/chroot = n'

sv start postfix
