FROM debezium/connect:1.5
ENV KAFKA_CONNECT_JDBC_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-jdbc \
    KAFKA_CONNECT_MONGODB_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-mongodb

ARG POSTGRES_VERSION=42.2.8
ARG KAFKA_JDBC_VERSION=5.3.2
ARG KAFKA_MONGO_VERSION=1.4.0

COPY drivers/postgresql-42.2.8.jar /kafka/libs/
COPY drivers/mysql-connector-java-8.0.23.jar /kafka/libs/
COPY drivers/mongodb-driver-3.9.1.jar /kafka/libs/

# Deploy Kafka Connect JDBC
RUN mkdir $KAFKA_CONNECT_JDBC_DIR && cd $KAFKA_CONNECT_JDBC_DIR &&\
	curl -sO https://packages.confluent.io/maven/io/confluent/kafka-connect-jdbc/$KAFKA_JDBC_VERSION/kafka-connect-jdbc-$KAFKA_JDBC_VERSION.jar

# Deploy Kafka Connect Mongo
RUN mkdir $KAFKA_CONNECT_MONGODB_DIR && cd $KAFKA_CONNECT_MONGODB_DIR &&\
    curl -sO https://repo1.maven.org/maven2/org/mongodb/kafka/mongo-kafka-connect/$KAFKA_MONGO_VERSION/mongo-kafka-connect-$KAFKA_MONGO_VERSION-all.jar
