USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
    album_id INT NOT NULL AUTO_INCREMENT,
    album_artist VARCHAR(128) NOT NULL,
    album_name VARCHAR(128) NOT NULL,
    album_release_date SMALLINT UNSIGNED NOT NULL,
    album_genre VARCHAR(128) NOT NULL,
    album_sales FLOAT(6,2),
    PRIMARY KEY(album_id)
);

