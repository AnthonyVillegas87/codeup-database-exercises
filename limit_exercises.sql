USE employees;
SELECT last_name
FROM employees
ORDER BY last_name DESC;
SELECT DISTINCT last_name FROM employees
WHERE employees.employees.last_name LIKE 'Z%'
LIMIT 10;
