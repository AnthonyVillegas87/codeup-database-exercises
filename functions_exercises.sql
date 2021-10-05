USE employees;

SELECT CONCAT(first_name, '', last_name) FROM employees WHERE last_name LIKE '%E' AND 'E%' ;


SELECT *
FROM employees
WHERE month(birth_date) = 12 AND DAY(birth_date) = 25;

SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2000
AND MONTH(birth_date) = 12 AND DAY(birth_date) = 25
ORDER BY birth_date, hire_date DESC;







