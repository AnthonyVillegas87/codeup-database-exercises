CREATE DATABASE social_media_db;
USE social_media_db;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
DROP TABLE users;



INSERT INTO users(username) VALUES
    ('Jmac'),
    ('BlueTheCat'),
    ('AlexanderTheGreat');

SELECT * FROM users;