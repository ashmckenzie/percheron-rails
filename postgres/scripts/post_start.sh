#!/bin/bash

source /etc/environment

[ -f /var/lib/postgresql/${POSTGRES_VERSION} ] && exit 0

chown -R postgres:postgres /var/lib/postgresql

sv stop postgres
sleep 10

setuser postgres /usr/lib/postgresql/${POSTGRES_VERSION}/bin/initdb -D /var/lib/postgresql/${POSTGRES_VERSION}/main

sv start postgres
sleep 10

setuser postgres psql --command "CREATE USER ${POSTGRES_USER} WITH SUPERUSER PASSWORD '${POSTGRES_PASSWORD}';"
setuser postgres createdb -O ${POSTGRES_USER} ${POSTGRES_DATABASE}
