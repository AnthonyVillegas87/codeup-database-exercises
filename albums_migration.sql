USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
    album_id INT NOT NULL AUTO_INCREMENT,
    album_artist VARCHAR(35) NOT NULL,
    album_name VARCHAR(35) NOT NULL,
    album_release_date DATETIME NOT NULL,
    album_sales FLOAT NOT NULL,
    album_genre VARCHAR(35),
    PRIMARY KEY(album_id)
);