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

# CURDATE(gives current date), CURTIME(gives current time) & NOW(gives current datetime)
INSERT INTO people(name, birthdate, birthtime, birth_date_time) VALUES('Michael', CURDATE(), CURTIME(), NOW());
SELECT * FROM people;

# FORMATTING DATES
SELECT name, birthdate FROM people;
SELECT name, DAY(birthdate) AS 'day of birth' FROM people;
SELECT name, birthdate, DAY(birthdate) AS 'day of birth' FROM people;
SELECT name, DAYNAME(birthdate) AS 'day of birth' FROM people;
SELECT name, birthdate, DAYOFWEEK(birthdate) AS 'day of birth' FROM people;
SELECT name, birthdate, DAYOFYEAR(birthdate) AS 'day of birth' FROM people;
SELECT name, birth_date_time, DAYOFYEAR(birth_date_time) AS 'day of birth' FROM people;
SELECT name, birth_date_time, MONTH(birth_date_time) AS 'day of birth' FROM people;
SELECT name, birth_date_time, MONTHNAME(birth_date_time) AS 'day of birth' FROM people;
SELECT name, birthtime, HOUR(birthtime) AS 'day of birth' FROM people;
SELECT name, birthtime, MINUTE(birthtime) AS 'day of birth' FROM people;
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
SELECT DATE_FORMAT(birthdate, '%W %M %Y') FROM people;
SELECT DATE_FORMAT(birth_date_time, '%W %M %Y') FROM people;
SELECT DATE_FORMAT(birth_date_time, '%m/%d/%Y') FROM people;
SELECT DATE_FORMAT(birth_date_time, '%m/%d/%Y at %h:%m') FROM people;