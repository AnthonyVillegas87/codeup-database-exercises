USE employees;

SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM employees
LIMIT 10;

SELECT CONCAT(last_name, ', ', first_name) AS full_name, birth_date AS DOB
FROM employees


