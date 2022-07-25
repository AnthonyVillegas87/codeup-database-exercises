-- #### DECIMAL ####
CREATE TABLE items(price DECIMAL(5, 2));
INSERT INTO items(price) VALUES(7);
INSERT INTO items(price) VALUES (7987654);
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.9999);
INSERT INTO items(price) VALUES(1.9999);
SELECT * FROM items;

-- #### FLOAT & DOUBLE ####
CREATE TABLE things(price FLOAT);
INSERT INTO things(price) VALUES(88.45);
SELECT * FROM things;
INSERT INTO things(price) VALUES(8877.45);
SELECT * FROM things;
INSERT INTO things(price) VALUES(8877665544.45);
SELECT * FROM things;

-- #### DATE, TIME, & DATETIME ####
CREATE TABLE people(
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birth_date_time DATETIME
);

INSERT INTO people(name, birthdate, birthtime, birth_date_time) VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
INSERT INTO people(name, birthdate, birthtime, birth_date_time) VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

SELECT * FROM people;

# CURDATE, CURTIME & NOW
