USE codeup_test_db;

# Write SELECT statements for:

#1. Albums released after 1991
SELECT release_date FROM albums
WHERE release_date > 1991;

#2. Albums with the genre 'disco'
SELECT genre AS 'Genre' FROM albums
WHERE genre = 'disco';

#3. Albums by 'Whitney Houston' (...or maybe an artist of your choice)
SELECT name FROM albums
WHERE artist = 'Whitney Houston';

# Write SELECT statements for:
# Albums released after 1991
SELECT * FROM albums
WHERE release_date > 1991;


# Albums with the genre 'disco'
SELECT * FROM albums
WHERE genre LIKE '%disco%';


# Albums by 'Whitney Houston' (...or maybe an artist of your choice)
SELECT * FROM albums
WHERE artist LIKE '%whitney houston%';


# DELETEs

DELETE FROM albums
WHERE release_date > 1991;

DELETE FROM albums
WHERE genre LIKE '%disco%';

DELETE FROM albums
WHERE artist LIKE '%whitney houston%';
SELECT * FROM albums;