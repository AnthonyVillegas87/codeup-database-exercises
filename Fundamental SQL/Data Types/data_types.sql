-- #### DECIMAL ####
CREATE TABLE items(price DECIMAL(5, 2));
INSERT INTO items(price) VALUES(7);
INSERT INTO items(price) VALUES (7987654);
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.9999);
INSERT INTO items(price) VALUES(1.9999);
SELECT * FROM items;

-- #### FLOAT & DOUBLE ####
CREATE TABLE things(price FLOAT);
INSERT INTO things(price) VALUES(88.45);
SELECT * FROM things;
INSERT INTO things(price) VALUES(8877.45);
SELECT * FROM things;
INSERT INTO things(price) VALUES(8877665544.45);
SELECT * FROM things;

-- #### DATE, TIME, & DATETIME ####
CREATE TABLE people(
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birth_date_time DATETIME
);

INSERT INTO people(name, birthdate, birthtime, birth_date_time) VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
INSERT INTO people(name, birthdate, birthtime, birth_date_time) VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

SELECT * FROM people;

# CURDATE(gives current date), CURTIME(gives current time) & NOW(gives current datetime)
INSERT INTO people(name, birthdate, birthtime, birth_date_time) VALUES('Michael', CURDATE(), CURTIME(), NOW());
SELECT * FROM people;

# FORMATTING DATES
SELECT name, birthdate FROM people;
SELECT name, DAY(birthdate) AS 'day of birth' FROM people;
SELECT name, birthdate, DAY(birthdate) AS 'day of birth' FROM people;
SELECT name, DAYNAME(birthdate) AS 'day of birth' FROM people;
SELECT name, birthdate, DAYOFWEEK(birthdate) AS 'day of birth' FROM people;
SELECT name, birthdate, DAYOFYEAR(birthdate) AS 'day of birth' FROM people;
SELECT name, birth_date_time, DAYOFYEAR(birth_date_time) AS 'day of birth' FROM people;
SELECT name, birth_date_time, MONTH(birth_date_time) AS 'day of birth' FROM people;
SELECT name, birth_date_time, MONTHNAME(birth_date_time) AS 'day of birth' FROM people;
SELECT name, birthtime, HOUR(birthtime) AS 'day of birth' FROM people;
SELECT name, birthtime, MINUTE(birthtime) AS 'day of birth' FROM people;
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
SELECT DATE_FORMAT(birthdate, '%W %M %Y') FROM people;
SELECT DATE_FORMAT(birth_date_time, '%W %M %Y') FROM people;
SELECT DATE_FORMAT(birth_date_time, '%m/%d/%Y') FROM people;
SELECT DATE_FORMAT(birth_date_time, '%m/%d/%Y at %h:%m') FROM people;

# DATE MATH
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
SELECT birth_date_time, DATE_ADD(birth_date_time, INTERVAL 1 MONTH) FROM people;
SELECT birth_date_time, DATE_ADD(birth_date_time, INTERVAL 10 SECOND ) FROM people;
SELECT birth_date_time, DATE_ADD(birth_date_time, INTERVAL 3 QUARTER) FROM people;
SELECT birth_date_time, birth_date_time + INTERVAL 5 MONTH FROM people;
SELECT birth_date_time, birth_date_time - INTERVAL 5 MONTH FROM people;
SELECT birth_date_time, birth_date_time + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

# TIMESTAMPS
CREATE TABLE comments (
  content VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW()
);
INSERT INTO comments(content) VALUES('lol what a funny article');
INSERT INTO comments(content) VALUES ('i found this offensive');

SELECT * FROM comments;

INSERT INTO comments(content) VALUES('wjduyfdubsbhui');
SELECT * FROM comments;

SELECT * FROM comments ORDER BY created_at;
SELECT * FROM comments ORDER BY created_at DESC;

CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO comments2(content) VALUES('lol THIS IS FAKE');
INSERT INTO comments2(content) VALUES ('Whoa, is this possible???');

SELECT * FROM comments2;

INSERT INTO comments2(content) VALUES ('???');

SELECT * FROM comments2;

UPDATE comments2 SET content = 'THIS IS NOT A TEST' WHERE content = '???';
SELECT * FROM comments2;
SELECT * FROM comments2 ORDER BY changed_at;

# EXERCISES
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8, 2),
    quantity INT
);

SELECT CURTIME() AS 'current time';
SELECT CURDATE() AS 'current date';
SELECT DAYOFWEEK(NOW()) AS 'current day of the week';
SELECT DAYNAME(NOW()) AS 'current day of the week';
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y at %h:%m');
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(140),
    created_at TIMESTAMP DEFAULT NOW()
);





