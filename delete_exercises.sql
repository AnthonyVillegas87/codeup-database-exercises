USE codeup_test_db;

SELECT * FROM albums WHERE album_release_date > 1991;

SELECT * FROM albums WHERE album_genre = 'Disco';

SELECT * FROM albums WHERE album_artist = 'Whitney Houston / Various artists';


DELETE FROM albums WHERE album_release_date > 1991;
DELETE FROM albums WHERE album_genre = 'Disco';
DELETE FROM albums WHERE album_artist = 'Whitney Houston / Various artists';

SELECT * FROM albums;