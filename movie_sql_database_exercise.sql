USE movies;

SELECT * FROM movie;

SELECT title, person_name, budget FROM movie m
JOIN movie_cast mc ON m.movie_id = mc.movie_id
JOIN person p ON mc.person_id = p.person_id
WHERE person_name = 'Danny DeVito'
OR person_name = 'Uma Thurman'
ORDER BY budget;