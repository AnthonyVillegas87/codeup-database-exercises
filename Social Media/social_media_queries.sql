USE social_media_db;

### FINDING OLDEST USERS ####
SELECT username, created_at FROM users ORDER BY created_at LIMIT 5;

#### MOST POPULAR REGISTRATION DATE ####
SELECT DAYNAME(created_at) AS popular_day, COUNT(*) AS total FROM users GROUP BY popular_day ORDER BY total DESC;

#### IDENTIFY INACTIVE USERS ####
SELECT username, image_url FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.id IS NULL;

#### SINGLE MOST LIKED PHOTO ####
SELECT username, photos.id, photos.image_url, COUNT(*) AS total FROM photos INNER JOIN likes ON likes.photo_id = photos.id INNER JOIN users ON photos.user_id = users.id GROUP BY photos.id ORDER BY total DESC LIMIT 1;

#### AMOUNT OF TIMES A USER POSTS ####
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;


####  5 most common hashtags ####
SELECT tags.tag_name, COUNT(*) AS total FROM photo_tags JOIN tags ON photo_tags.tag_id = tags.id GROUP BY tags.id ORDER BY total DESC LIMIT 5;

#### USERS WHO HAVE LIKE  ####
SELECT username, COUNT(*) AS total_likes
FROM users
    INNER JOIN likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING total_likes = (SELECT COUNT(*) FROM photos);