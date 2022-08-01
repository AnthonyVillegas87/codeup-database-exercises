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
