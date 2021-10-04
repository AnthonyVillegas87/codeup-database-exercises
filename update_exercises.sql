USE codeup_test_db;
#All albums in your table

SELECT album_name, album_sales FROM albums;
UPDATE albums
SET album_sales = (album_sales * 10);




#All albums released before 1980
SELECT album_name, album_release_date FROM albums
WHERE album_release_date < 1980;
UPDATE albums
SET album_release_date = 1800
WHERE album_release_date < 1979;



#All albums by Michael Jackson
SELECT album_name, album_artist FROM albums
WHERE album_artist = 'Michael Jackson';
UPDATE albums
SET album_artist = 'Peter Jackson'
WHERE album_artist = 'Michael Jackson';

SELECT * FROM albums;

