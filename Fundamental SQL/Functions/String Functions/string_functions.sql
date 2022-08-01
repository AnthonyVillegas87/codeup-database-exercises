# ##### STRING FUNCTIONS #########

###### CONCAT ######
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full_name' FROM books;

SELECT author_fname AS first_name, author_lname AS last_name,
       CONCAT(author_fname, ' , ', author_lname) AS full_name FROM books;

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
SELECT REVERSE(' Why does my cat look at me with such hatred? ');
SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));
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
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT title FROM books ORDER BY title DESC;
SELECT released_year FROM books ORDER BY released_year;
SELECT DISTINCT author_fname FROM books ORDER BY author_fname;
SELECT released_year, pages FROM books ORDER BY released_year;
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
