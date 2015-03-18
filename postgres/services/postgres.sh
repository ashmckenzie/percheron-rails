#!/bin/bash

exec 2>&1

source /etc/environment

mkdir -p /var/run/postgresql/${POSTGRES_VERSION}-main.pg_stat_tmp
chown -R postgres:postgres /var/run/postgresql

exec /sbin/setuser \
postgres \
/usr/lib/postgresql/${POSTGRES_VERSION}/bin/postgres \
-D /var/lib/postgresql/${POSTGRES_VERSION}/main \
-c config_file=/etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf 2>&1
