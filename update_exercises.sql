USE codeup_test_db;

#2.Write SELECT statements to output each of the following with a caption:
#3.After each SELECT add an UPDATE statement to:

#2A. All albums in your table.
SELECT name, sales FROM albums;
#3A. Make all the albums 10 times more popular (sales * 10)
UPDATE albums
SET sales = (sales * 10);

#2B. All albums released before 1980
SELECT name AS Album, release_date AS 'Release date' FROM albums
WHERE release_date <= 1980;
#3B. Move all the albums before 1980 back to the 1800s.
UPDATE albums
SET release_date = 1800
WHERE release_date < 1979;

#2C. All albums by Michael Jackson
SELECT name AS 'Michael Jackson albums' FROM albums
WHERE artist = 'Michael Jackson';
#3C. Change 'Michael Jackson' to 'Peter Jackson'
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';

SELECT * FROM albums;
