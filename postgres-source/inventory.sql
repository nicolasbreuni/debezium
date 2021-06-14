CREATE TABLE products (
                          id SERIAL NOT NULL PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          description VARCHAR(512),
                          weight FLOAT
);
