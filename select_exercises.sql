USE codeup_test_db;

SELECT 'The name of all Pink Floyd albums are';

# The name of all albums by Pink Floyd
SELECT name AS 'Albums from Pink Floyd' FROM albums
WHERE artist = 'Pink Floyd';

# The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date AS 'Release date of Sgt. Peppers Lonely Hearts Club Band' FROM albums
WHERE name = 'Sgt. Peppers Lonely Hearts Club Band';

# The genre for Nevermind
SELECT genre AS 'Genre for Nevermind' FROM albums
WHERE name = 'Nevermind';

# Which albums were released in the 1990s
SELECT name AS 'Album', release_date AS 'Release date' FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

# Which albums had less than 20 million certified sales
SELECT name, sales FROM albums
WHERE sales < 20;

# All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT artist AS Artist, name AS Album, genre AS Genre FROM albums
WHERE genre = 'Rock';