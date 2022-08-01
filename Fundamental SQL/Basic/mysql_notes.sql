#### SHOW CLAUSE ####
SHOW DATABASES;

#### CREATE CLAUSE (DATABASES) ####
CREATE DATABASE db_name;

#### DROP CLAUSE ####
DROP DATABASE db_name;

#### USE CLAUSE ####
USE db_name;

#### CREATE COMMAND (TABLES)####
CREATE TABLE tablename
(
    column_name data_type,
    column_name data_type
);
CREATE TABLE cats
(
    name VARCHAR(100),
    age INT
);

#### DROP COMMAND (TABLES) ###
DROP TABLE table_name;


#### INSERT COMMAND ####
INSERT INTO table_name(column_name) VALUES (data);

INSERT INTO table_name
(column_name, column_name)
VALUES      (value, value),
            (value, value),
            (value, value);


#### PRIMARY KEYS ####

CREATE TABLE unique_cats
(
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

DESC unique_cats;

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);

INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'Louise', 3);

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'James', 3);

SELECT * FROM unique_cats;


#### AUTO_INCREMENT ####

CREATE TABLE unique_cats2 (
                              cat_id INT NOT NULL AUTO_INCREMENT,
                              name VARCHAR(100),
                              age INT,
                              PRIMARY KEY (cat_id)
);

INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);

SELECT * FROM unique_cats2;

#### SELECT COMMANDS ####

### SELECT ####
SELECT * FROM cats;

SELECT name FROM cats;

SELECT age FROM cats;

SELECT cat_id FROM cats;

SELECT name, age FROM cats;

SELECT cat_id, name, age FROM cats;

SELECT age, breed, name, cat_id FROM cats;

SELECT cat_id, name, age, breed FROM cats;



#### UPDATE ####
UPDATE cats SET breed = 'Shorthair' WHERE breed = 'Tabby';
UPDATE cats SET age = 14 WHERE name = 'Misty';







#### CHAR & VARCHAR (STORING TEXT) ####
CREATE TABLE dogs(name CHAR(5), breed VARCHAR(10));
INSERT INTO dogs(name, breed) VALUES ('zeus', 'german shepard');
INSERT INTO dogs(name, breed) VALUES ('koda', 'beagle');

#### DECIMAL(M,D) / M = NUMBER OF DIGITS or (THE PRECISION), D = NUMBER OF DIGITS TO THE RIGHT or (THE SCALE) ####
CREATE TABLE items(price DECIMAL(5, 2));
INSERT INTO items(price) VALUES(7);
INSERT INTO items(price) VALUES(7987654);
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.9999);
INSERT INTO items(price) VALUES(1.9999);
