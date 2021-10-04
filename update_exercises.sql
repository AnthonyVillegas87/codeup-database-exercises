USE codeup_test_db;

SELECT album_artist, album_name FROM albums
WHERE album_release_date< 1980;

#Name of all albums by Pink Floyd
SELECT album_id, album_artist, album_name FROM albums
WHERE album_artist = 'Pink Floyd';
#The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT album_release_date FROM albums
WHERE album_name = 'Sgt. Peppers Lonely Hearts Club Band';
#The genre for Nevermind
SELECT album_genre From albums
WHERE album_name = 'Nevermind';
#Which albums were released in the 1990s
SELECT album_release_date, album_name, album_artist From albums
WHERE album_release_date BETWEEN  '1990' AND '1999';
#Which albums had less than 20 million certified sales
SELECT album_name, album_sales FROM albums
WHERE album_sales <= '20';
#All the albums with a genre of "Rock".
# Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
