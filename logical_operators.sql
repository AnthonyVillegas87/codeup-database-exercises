# NOT EQUAL !=
SELECT title FROM books WHERE release_date != 2017;
SELECT name FROM authors WHERE name != 'Stephen King';

# NOT LIKE
SELECT title FROM books WHERE title NOT LIKE 'W%';
SELECT title FROM books WHERE title NOT LIKE 'E%';

# GREATER THAN >
SELECT title, DATE_FORMAT(release_date, '%m/%d/%Y at %h:%m') AS 'date & time' FROM books WHERE release_date >= 2020 ORDER BY release_date;
SELECT 99 > 1;


# LESS THAN <
SELECT title, released_year FROM books WHERE released_year < 2000 ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year <= 2000 ORDER BY released_year;

# LOGICAL AND &&
SELECT * FROM books WHERE author_lname = 'Eggers' AND books.released_year > 2010;
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' AND released_year > 2010 AND title LIKE '%novel';

# LOGICAL OR ||
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' OR released_year > 2010;
SELECT title, author_lname, released_year, stock_quantity FROM books WHERE author_lname = 'Eggers' OR released_year > 2010 OR stock_quantity > 100;

# BETWEEN
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;
SELECT name, birth_date_time FROM people WHERE birth_date_time BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);


# IN & NOT IN
USE book_store_db;
SELECT title, author_lname FROM books WHERE author_lname = 'Carver' OR author_lname = 'Lahiri' OR author_lname = 'Smith';
SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year FROM books WHERE released_year IN (2017, 1985);

SELECT title, author_lname FROM books WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year FROM books WHERE released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016);
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016);
SELECT title, released_year FROM books WHERE released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016);
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;

# CASE STATEMENTS
SELECT title, released_year, CASE WHEN released_year >= 2000 THEN 'Modern Literature' ELSE '20th Century Literature' END AS era FROM books;
SELECT title, released_year, IF(released_year >= 2000, 'Modern Literature', '20th Century Literature') AS era FROM books;

SELECT title, stock_quantity, CASE WHEN stock_quantity BETWEEN 0 AND 50 THEN '*' WHEN stock_quantity BETWEEN 51 AND 100 THEN '**' ELSE '***' END AS stock FROM books;

SELECT title, stock_quantity, CASE
    WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
    WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
    WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
    ELSE '****' END AS stock
FROM books;

# EXERCISES
SELECT title, released_year FROM books WHERE released_year < 1980;
SELECT title, author_lname FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;
SELECT * FROM books WHERE pages BETWEEN 100 AND 200 ORDER BY pages;
SELECT title, author_lname FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

# CASE EXERCISES
SELECT title, author_lname, CASE WHEN title LIKE '%stories%' THEN 'Short Stories' WHEN title LIKE '%Just Kids%' OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir' ELSE 'Novel' END AS type FROM books;

