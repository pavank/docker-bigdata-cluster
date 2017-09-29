FROM postgres:9.6

LABEL Description="This is the postgres DB  for Hive metastore schema" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

ENV PGDATA /var/lib/postgresql/data/pgdata
ENV POSTGRES_USER hive
ENV POSTGRES_PASSWORD hive
ENV POSTGRES_DB metastore

HEALTHCHECK CMD pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB} || exit 1

ADD 01-postgres-init.sql  /docker-entrypoint-initdb.d/
ADD 02-hive-schema-2.3.0.postgres.sql  /docker-entrypoint-initdb.d/
ADD 03-hive-txn-schema-2.3.0.postgres.sql  /docker-entrypoint-initdb.d/
