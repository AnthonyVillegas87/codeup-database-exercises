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

CREATE TABLE comments(
  id INT AUTO_INCREMENT PRIMARY KEY,
  comment_text VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photos(id)
);

CREATE TABLE likes(
   user_id INT NOT NULL,
   photo_id INT NOT NULL,
   created_at TIMESTAMP DEFAULT NOW(),
   FOREIGN KEY(user_id) REFERENCES users(id),
   FOREIGN KEY(photo_id) REFERENCES photos(id),
   PRIMARY KEY(user_id, photo_id)
);


INSERT INTO users(username) VALUES
    ('Jmac'),
    ('BlueTheCat'),
    ('AlexanderTheGreat');

INSERT INTO photos(image_url, user_id) VALUES
   ('/alsjk76', 1),
   ('/aldjn24', 2),
   ('/iniaeuhfiquhe22', 2);

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
   ('What a Great Scene!!', 1, 2),
   ('Meow!', 3, 2),
   ('Whoa, Marvelous!', 2, 1);

INSERT INTO likes(user_id, photo_id) VALUES
    (1, 1),
    (2, 1),
    (1, 2),
    (1, 3),
    (3, 3);


SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;