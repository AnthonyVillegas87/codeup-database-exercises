USE codeup_test_db;

SELECT * FROM albums WHERE album_release_date > 1991;

SELECT * FROM albums WHERE album_genre = 'Disco';

SELECT * FROM albums WHERE album_artist = 'Whitney Houston / Various artists';


DELETE FROM albums WHERE album_release_date > 1991;
DELETE FROM albums WHERE album_genre = 'Disco';
DELETE FROM albums WHERE album_artist = 'Whitney Houston / Various artists';

SELECT * FROM albums;



#### DELETE ####

DELETE FROM cats WHERE name='Egg';

SELECT * FROM cats;

SELECT * FROM cats WHERE name='egg';

DELETE FROM cats WHERE name='egg';

SELECT * FROM cats;

DELETE FROM cats;
