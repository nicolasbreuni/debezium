# Debezium Projekt im Rahmen der Studienarbeit an der DHBW Stuttgart

## Voraussetzungen

Folgendes sollte installiert sein:
- Docker
- docker-compose
- Postman (optional)

## Dienste starten

Mit folgendem Befehl können alle erforderlichen Dienste gestartet werden:
`docker-compose up -d`

## Konnektoren starten

Es kann zwischen verschiedenen Konnektoren ausgewählt werden:

### Source

Als Erstes sollte die Quelle der Daten ausgewählt werden. Dafür kann zwischen PostgreSQL und MySQL ausgewählt werden.
Grundsätzlich sollte nur ein Source-Konnektor gestartet werden.
Ein Konnektor kann nach der Erstellung mit einer DELETE-Anfrage an den Endpunkt `http://localhost:8083/connectors/{connectorname}` gelöscht werden.
`connectorname` steht hierbei für den Namen des Konnektors. Dieser ist im JSON des jeweiligen Konnektors definiert.

#### PostgreSQL Source

Um den PostgreSQL-Konnektor zu starten, muss der Inhalt von postgres-source.json an den Endpunkt `http://localhost:8083/connectors` via POST-Request gesendet werden.
In Postman muss dafür lediglich POST als http-Methode ausgewählt werden, die korrekte URL eingetragen werden und der Body unter Body>Raw>JSON eingefügt werden.

#### MySQL Source

Der MySQL-Konnektor wird genau wie der PostgreSQL-Konnektor hinzugefügt. Hierfür wird lediglich die mysql-source.json Datei verwendet.

### Sink

Anschließend kann ein Sink Konnektor gestartet werden. Hierfür kann zwischen PostgreSQl, MySQL und MongoDB ausgewählt werden.
Es können zwar auch mehrere Sink Konnektoren gestartet werden.
Ich empfehle jedoch nur einen zu starten, da es sonst zu unvorhersehbaren Nebeneffekten kommen kann.

#### PostgreSQL Sink

Genau wie bei den Source-Konnektoren muss der Inhalt der postgres-sink.json Datei an den Endpunkt `http://localhost:8083/connectors` via POST-Request gesendet werden.

#### MySQL Sink

Siehe PostgreSQL Sink nur mit der mysql-sink.json Datei.

#### MongoDB Sink

Auch hier siehe PostgreSQL Sink nur mit mongo-sink.json.

## Daten einfügen

In die unter Source ausgewählte Datenbank können jetzt Daten eingefügt werden.
In beiden Datenbanken sollte bereits eine Datenbank `inventory` mit der Tabelle `products` existieren.

### Postgres

Um eine SQL-Shell zu öffnen, muss folgender Befehl ausgeführt werden:
`docker-compose exec postgres-source psql -U postgresuser -W inventory`
Als Passwort muss anschließend `postgrespw` eingegeben werden.

Anschließend können Daten mit einfachen SQL-Befehlen eingefügt werden:
`INSERT INTO products (name, description, weight) VALUES('Laptop', 'DELL Laptop', 1.0);`

### MySQL

Um eine SQL-Shell zu öffnen, muss folgender Befehl ausgeführt werden:
`docker-compose exec mysql-source mysql --user mysqluser --password inventory`
Als Passwort muss anschließend `mysqlpw` eingegeben werden.

Anschließend können Daten mit einfachen SQL-Befehlen eingefügt werden:
`INSERT INTO products (name, description, weight) VALUES('Laptop', 'DELL Laptop', 1.0);`

## Daten auslesen

### PostgreSQL

Um eine SQL-Shell zu öffnen, muss folgender Befehl ausgeführt werden:
`docker-compose exec postgres-sink psql -U postgresuser -W inventory`
Als Passwort muss anschließend `postgrespw` eingegeben werden.

Anschließend können Daten mit dem SQL-Befehlen ausgelesen werden:
`SELECT * FROM products;`

### MySQL

Um eine SQL-Shell zu öffnen, muss folgender Befehl ausgeführt werden:
`docker-compose exec mysql-sink mysql --user root --password inventory`
Als Passwort muss anschließend `debezium` eingegeben werden.

Anschließend können Daten mit dem SQL-Befehlen ausgelesen werden:
`SELECT * FROM products;`


### MongoDB

Um eine MongoDB Shell zu öffnen, muss folgender Befehl ausgeführt werden:
`docker-compose exec mongodb-sink mongo "mongodb://root:mongopw@mongodb-sink:27017/inventory?authSource=admin"`

Anschließend können Daten mit dem SQL-Befehlen ausgelesen werden:
`db.products.find()`
