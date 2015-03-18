FROM rails_base-thin:1.0.0
MAINTAINER ash@the-rebellion.net

# Environment
#
ENV POSTGRES_VERSION 9.4

# Setup
#
RUN apt-get update
RUN apt-get -y install postgresql-9.4

ADD ./config/environment /tmp/environment
RUN cat /tmp/environment >> /etc/environment

# PGSQL
#
RUN mkdir -p /var/lib/postgresql/${POSTGRES_VERSION} /etc/postgresql/${POSTGRES_VERSION}/main/conf.d
RUN chown -R postgres:postgres /etc/postgresql /var/log/postgresql /var/lib/postgresql /var/run/postgresql /var/lib/postgresql/${POSTGRES_VERSION}
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/${POSTGRES_VERSION}/main/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /etc/postgresql/${POSTGRES_VERSION}/main/conf.d/extra.conf
RUN sed -i 's/#include_dir/include_dir/' /etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf

# Services
#
RUN mkdir -p /etc/service/postgres
ADD ./services/postgres.sh /etc/service/postgres/run

# Fix permissions
#
RUN chmod 755 /etc/service/*/run

# Volumes
#
VOLUME  [ "/var/log", "/var/lib/postgresql" ]

# Ports
#
EXPOSE 5432

CMD [ "/sbin/my_init" ]
