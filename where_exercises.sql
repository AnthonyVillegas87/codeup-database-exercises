USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT * FROM employees
WHERE last_name LIKE 'E%';

SELECT * FROM employees
WHERE last_name LIKE 'q%';

SELECT first_name
FROM employees
WHERE last_name IN ('Irena', 'Vidya', 'Maya')
OR gender = 'M';

