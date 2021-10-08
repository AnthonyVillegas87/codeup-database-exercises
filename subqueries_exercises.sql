USE employees;

SELECT emp_no FROM employees;

SELECT hire_date, CONCAT(first_name, ' ', last_name) FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );


SELECT title , COUNT(*) FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
    )
GROUP BY title;

SELECT  CONCAT(first_name, ' ', last_name) AS full_name FROM  employees
WHERE gender = 'F' AND emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date >= NOW()
    );



