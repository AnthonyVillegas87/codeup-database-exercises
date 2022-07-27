CREATE DATABASE customers_and_orders_db;
USE customers_and_orders_db;



CREATE TABLE customers (
    id  INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_date DATE,
  amount DECIMAL(8, 2),
  customer_id INT,
  FOREIGN KEY(customer_id) REFERENCES customers(id)
);


INSERT INTO customers(first_name, last_name, email)
VALUES('George', 'Tudor', 'george@gmail.com'),
    ('Matthew', 'Baker', 'matthew@yahoo.com'),
    ('Ray', 'Corona', 'ray@icloud.com'),
    ('Jordan', 'Lafoe', 'jordan@gmail.com'),
    ('Jason', 'Maccarthy', 'jmac@yahoo.com'),
    ('Anthony', 'Villegas', 'anthony@gmail.com');

INSERT INTO orders(order_date, amount, customer_id)
VALUES ('2016/02/10',99.99 , 1),
     ('2017/11/11', 35.50, 1),
     ('2014/12/12', 800.67, 2),
     ('2015/01/03', 12.50, 2),
     ('1999/04/11', 450.25, 5);

SELECT * FROM orders;
SELECT * FROM customers;

####  CROSS JOIN ####
# TWO-STEP PROCESS
SELECT * FROM customers WHERE last_name = 'Tudor';
SELECT * FROM orders WHERE customer_id = 1;

# USING SUB-QUERY
SELECT * FROM orders WHERE customer_id =
     (
       SELECT id FROM customers
       WHERE last_name = 'Tudor'
     );

# BASIC CROSS JOIN
SELECT * FROM customers, orders;


#### (IMPLICIT) INNER JOIN ####
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id = orders.customer_id;

#### (EXPLICIT) INNER JOIN ####
SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id ORDER BY order_date;
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id ORDER BY amount;



#### LEFT JOIN ####
# SET GLOBAL sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SELECT first_name, last_name, order_date, SUM(amount) AS 'total_spent' FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY orders.customer_id ORDER BY total_spent;
SELECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total_spent FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id ORDER BY total_spent;

#### RIGHT JOIN PT 1 ####
SELECT first_name, last_name, order_date, amount FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id;

#### RIGHT JOINS PT 2 ####
SELECT first_name, last_name, order_date, amount FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id ORDER BY first_name;


#### ON DELETE CASCADE ####
DROP TABLE customers, orders;

CREATE TABLE customers (
                           id  INT AUTO_INCREMENT PRIMARY KEY,
                           first_name VARCHAR(100),
                           last_name VARCHAR(100),
                           email VARCHAR(100)
);

CREATE TABLE orders(
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       order_date DATE,
                       amount DECIMAL(8, 2),
                       customer_id INT,
                       FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

SELECT * FROM customers;
SELECT * FROM orders;
DELETE FROM customers WHERE email = 'george@gmail.com';

#### JOINS EXERCISES ####
CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers(title, grade, student_id) VALUES
('My First Book Report', 60, 1),
('My Second Book Report', 75, 1),
('Russian Lit Through The Ages', 94, 2),
('De Montaigne and The Art of The Essay', 98, 2),
('Borges and Magical Realism', 89, 4);

#### EXPLICIT INNER JOIN ####
SELECT first_name, title, grade FROM students JOIN papers WHERE students.id = papers.student_id ORDER BY grade DESC;

#### LEFT JOIN ####
SELECT first_name, title, grade FROM students LEFT JOIN papers ON students.id = papers.student_id;
SELECT first_name, IFNULL(title, 'missing'), IFNULL(grade, 0) FROM students LEFT JOIN papers ON students.id = papers.student_id;

SELECT first_name, IFNULL(AVG(grade), 0) AS average FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY students.id ORDER BY average DESC;
SELECT first_name, IFNULL(AVG(grade), 0) AS average,
       CASE WHEN AVG(grade) >= 75 THEN 'passing' ELSE 'failing' END AS passing_status
FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY students.id ORDER BY average DESC;
