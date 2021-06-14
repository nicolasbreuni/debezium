FROM debezium/postgres:11

ENV POSTGRES_DB inventory

COPY inventory.sql /docker-entrypoint-initdb.d/
