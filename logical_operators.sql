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