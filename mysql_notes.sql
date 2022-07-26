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

##### ALIASES ####
SELECT cat_id AS id, name FROM cats;

SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

DESC cats;

#### UPDATE ####
UPDATE cats SET breed = 'Shorthair' WHERE breed = 'Tabby';
UPDATE cats SET age = 14 WHERE name = 'Misty';


#### DELETE ####

DELETE FROM cats WHERE name='Egg';

SELECT * FROM cats;

SELECT * FROM cats WHERE name='egg';

DELETE FROM cats WHERE name='egg';

SELECT * FROM cats;

DELETE FROM cats;


# ##### STRING FUNCTIONS #########

###### CONCAT ######
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full_name' FROM books;

SELECT author_fname AS first_name, author_lname AS last_name,
    -> CONCAT(author_fname, ' , ', author_lname) AS full_name FROM books;

###### SUBSTRING ######
SELECT SUBSTRING(title, 1, 11);
SELECT CONCAT(SUBSTRING(title, 1, 11), '...') AS short_title FROM books;

###### REPLACE #####
SELECT REPLACE(title, 'e', 3);
SELECT SUBSTRING(
               REPLACE(title, 'e', 3), 1, 12) FROM books;

##### REVERSE #####
SELECT REVERSE(author_fname) FROM books;
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

#### CHAR_LENGTH ####
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

#### UPPER() & LOWER() #####
SELECT UPPER(title) FROM books;
SELECT CONCAT(' MY FAVORITE TITLES ARE ', LOWER(title)) FROM books;

# This works:

# SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
# FROM books;


# While this does not:

# SELECT CONCAT(UPPER(author_fname, ' ', author_lname)) AS "full name in caps"
# FROM books;


# UPPER only takes one argument and CONCAT takes two or more arguments, so they can't be switched in that way.
# You could do it this way, however:

# SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS "full name in caps"
# FROM books;
# But, the first example above would be better (more DRY*) because you wouldn't need to call UPPER two times.

# *Don't Repeat Yourself*


SELECT CONCAT(' MY FAVORITE TITLES ARE ', LOWER(title)) FROM books;
SELECT REVERSE(" Why does my cat look at me with such hatred? ");
SELECT REVERSE(UPPER("Why does my cat look at me with such hatred?"));
SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '-');
SELECT REPLACE(title, ' ', '->') FROM books;
SELECT author_lname AS 'forwards', REVERSE(author_lname) AS 'backwards' FROM books;
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;
SELECT CONCAT(title, ' Was released in ', released_year) AS 'title release' FROM books;
SELECT title, CHAR_LENGTH(title) AS 'char count' FROM books;
SELECT
    CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    CONCAT(author_fname, ',', author_lname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity FROM books;

#### DISTINCT ####
SELECT DISTINCT author_lname FROM books;
SELECT released_year FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) AS 'full name' FROM books;

#### ORDER BY ####
SELECT author_fname FROM books ORDER BY author_fname;
SELECT autor_lname FROM books ORDER BY author_lname DESC;
SELECT title FROM books ORDER BY title DESC;
SELECT released_year FROM books ORDER BY released_year;
SELECT DISTINCT author_fname FROM books ORDER BY author_fname;
SELECT, released_year, pages FROM books ORDER BY released_year;
SELECT title, author_fname, author_lname FROM books ORDER BY 3;
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

#### LIMIT ####
SELECT title FROM books LIMIT 10;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5, 10;
SELECT title, pages FROM books WHERE pages LIKE '%___%' ORDER BY pages DESC LIMIT 1;
SELECT CONCAT(title, ' - ', released_year) AS 'summary' FROM books ORDER BY released_year DESC LIMIT 3;
SELECT * FROM tbl LIMIT 95,18446744073709551615;

SELECT title FROM books LIMIT 5;

SELECT title FROM books LIMIT 5, 123219476457;

SELECT title FROM books LIMIT 5, 50;

#### LIKE w/ '% %' (wildcard) ####
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE '%the%';
SELECT title, author_fname FROM books WHERE author_fname LIKE '%e';
SELECT title FROM books WHERE title LIKE '%\%%';
SELECT title FROM books WHERE title LIKE '%stories%';
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title, released_year, stock_quantity FROM books WHERE stock_quantity LIKE '__' ORDER BY stock_quantity LIMIT 3;

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '___';
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';

SELECT UPPER(CONCAT(' my favorite author is ' ,author_fname, ' ', author_lname, '!')) AS 'yell' FROM books ORDER BY author_lname;

#### AGGREGATE FUNCTIONS ####

#### COUNT ####
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

#### GROUP BY ####
SELECT title, author_lname FROM books GROUP BY author_lname;
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year,' ', COUNT(*), ' books(s) released') AS year FROM books GROUP BY released_year;

#### MIN & MAX ####
SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;

#### SUBQUERIES ####
SELECT * FROM books WHERE pages = (SELECT MIN(pages) FROM books);
SELECT * FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT title, pages FROM books WHERE pages =(SELECT MIN(pages) FROM books);
SELECT title, pages FROM books WHERE pages =(SELECT MAX(pages) FROM books);

#### MIN & MAX W/ GROUP BY ####
SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;
SELECT author_fname, author_lname, MAX(pages) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author, MAX(pages) AS 'longest book' FROM books GROUP BY author_lname, author_fname;

#### THE SUM FUNCTION ####
SELECT SUM(pages) FROM books;
SELECT SUM(released_year) FROM books;

SELECT author_fname, author_lname, SUM(pages) AS 'total pages' FROM books GROUP BY author_lname, author_fname;


#### THE AVG FUNCTION ####
SELECT AVG(released_year) FROM books;
SELECT AVG(pages) FROM books;
SELECT AVG(stock_quantity) FROM books GROUP BY released_year;
SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;

SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;


SELECT pages, CONCAT(author_fname, ' ', author_lname) AS 'full name' FROM books ORDER BY pages DESC;
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name' FROM books ORDER BY pages DESC LIMIT 1;
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name' FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;
SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;
SELECT SUM(stock_quantity) AS 'total # of books in stock' FROM books;
SELECT SUM(stock_quantity) FROM books;
SELECT released_year, COUNT(*) AS 'number of books' FROM books GROUP BY released_year;
SELECT COUNT(*) AS 'number of books' FROM books GROUP BY released_year;
SELECT COUNT(*) FROM books;
SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;
SELECT released_year AS year, COUNT(*) AS '# of books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year;


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
