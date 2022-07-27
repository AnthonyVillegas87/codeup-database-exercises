CREATE DATABASE social_media_db;
USE social_media_db;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
DROP TABLE users;

CREATE TABLE photos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);


INSERT INTO users(username) VALUES
    ('Jmac'),
    ('BlueTheCat'),
    ('AlexanderTheGreat');

INSERT INTO photos(image_url, user_id) VALUES
   ('/alsjk76', 1),
   ('/aldjn24', 2),
   ('/iniaeuhfiquhe22', 2);

SELECT * FROM users;
SELECT * FROM photos;