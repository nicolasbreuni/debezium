GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'replicator' IDENTIFIED BY 'replpass';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT  ON *.* TO 'debezium' IDENTIFIED BY 'dbz';

CREATE DATABASE inventory;
GRANT ALL PRIVILEGES ON inventory.* TO 'mysqluser'@'%';

# Switch to this database
USE inventory;

CREATE TABLE products (
                          id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          description VARCHAR(512),
                          weight FLOAT
);
