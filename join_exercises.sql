USE employees;

SELECT dept_name AS 'Department Name',CONCAT(first_name, ' ',last_name) AS 'Department Manager' FROM departments
JOIN dept_manager
    ON departments.dept_no = dept_manager.dept_no
JOIN employees
    ON dept_manager.emp_no = employees.emp_no
WHERE to_date >= NOW()
ORDER BY dept_name ;


SELECT dept_name AS 'Department Name',CONCAT(first_name, ' ',last_name) AS 'Department Manager' FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE to_date >= NOW()
AND employees.gender= 'F' ORDER BY dept_name ;

SELECT title AS 'Titles', COUNT(title) FROM titles
    JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
    JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Customer Service'
    AND titles.to_date = '9999-01-01'
    AND dept_emp.to_date = '9999-01-01'
GROUP BY title;


