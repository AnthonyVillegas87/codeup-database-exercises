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
