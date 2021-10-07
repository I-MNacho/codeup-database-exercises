USE codeup_test_db;

CREATE TABLE different_quotes (
                                  id INT NOT NULL AUTO_INCREMENT,
                                  content VARCHAR(240) NOT NULL,
                                  author VARCHAR(50) NOT NULL,
                                  PRIMARY KEY (id)
);

INSERT INTO different_quotes (content, author)
VALUES ('The real voyage of discovery consists not in seeking new landscapes, but in having new eyes.', 'Marcel Proust');

SELECT * FROM different_quotes;

ALTER TABLE different_quotes ADD UNIQUE (content);

#ONCE ALTERED AND THEN THE INSERT INTO METHOD WAS RUN AGAIN WE GET THIS ERROR
#[23000][1062] Duplicate entry 'The real voyage of discovery consists not in seeking new landsca' for key 'different_quotes.content'

SHOW INDEXES FROM different_quotes;

USE employees;

SHOW INDEXES FROM salaries;

DROP INDEX salary_index ON salaries;

SHOW TABLES;

DESCRIBE current_dept_emp;

DESCRIBE departments;

DESCRIBE dept_emp;

DESCRIBE dept_emp_latest_date;

DESCRIBE dept_manager;

DESCRIBE employees;

DESCRIBE salaries;

DESCRIBE titles;

USE codeup_test_db;

ALTER TABLE albums ADD UNIQUE unique_artist_and_name (artist, name);

SELECT * FROM albums;

INSERT INTO albums (artist, name, release_date, genre, sales)
VALUES ('Michael Jackson', 'Thriller', 1982,'Pop, post-disco, funk, rock', 48.9);

CREATE TABLE persons(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(25) NOT NULL,
    album_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (album_id) REFERENCES albums (id)
);


