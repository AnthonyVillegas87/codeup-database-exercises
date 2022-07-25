# NOT EQUAL !=
SELECT title FROM books WHERE release_date != 2017;
SELECT name FROM authors WHERE name != 'Stephen King';

# NOT LIKE
SELECT title FROM books WHERE title NOT LIKE 'W%';
SELECT title FROM books WHERE title NOT LIKE 'E%';

# GREATER THAN
