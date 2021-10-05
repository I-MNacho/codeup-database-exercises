USE employees;

#CONCAT()
SELECT CONCAT ('Hello', ' ', 'World');

SELECT SUBSTRING ('Hello World', 1, 5);

SELECT CONCAT (first_name, ' ', last_name, ' was born ', birth_date), emp_no
FROM employees;

#LENGTH() - used to find the length of a string
SELECT LENGTH('whateverkindofstring');

#Output first_name , and length of first name as two columns
SELECT first_name, LENGTH(first_name) FROM employees;

#Combining Functions
SELECT UPPER(CONCAT('hello', TRIM(' world  ')));

#================= DATE FUNCTIONS  (return units of time)

#NOW()
SELECT NOW();

#DAY(), MONTH(), YEAR()

SELECT DAY('1999-04-02');
SELECT MONTH('1999-04-02');
SELECT YEAR('1999-04-02');

#CURDATE()
SELECT CURDATE();

#CURTIME()
SELECT CURTIME();

#UNIX_TIMESTAMP()
SELECT UNIX_TIMESTAMP();

SELECT CONCAT(
               'Teaching people to code for',
               UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
               ' seconds'
           );

#================= AGGREGATE FUNCTIONS (info about results)

# COUNT()

#count all table records
SELECT COUNT(*) FROM employees;

#count all salaries to now
SELECT COUNT(*) FROM salaries WHERE to_date > NOW();


#count total filtered results
SELECT COUNT(*)
FROM employees
WHERE birth_date = '1953-09-02';

#count each unique instance of a value

#MAX() / MIN()
SELECT MAX(birth_date) FROM employees;
SELECT MIN(birth_date) FROM employees;

#SUM()
SELECT salary, from_date
FROM salaries
WHERE emp_no = 10001
ORDER BY from_date ASC;

SELECT AVG(salary)
FROM salaries
WHERE emp_no = 10001;