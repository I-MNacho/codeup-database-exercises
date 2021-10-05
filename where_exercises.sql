USE employees;

#2. Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT * FROM employees
WHERE gender = 'M'
  AND
    (first_name LIKE 'Irena'
        OR first_name LIKE 'Vidya'
        OR first_name LIKE 'Maya');

#3. Find all employees whose last name starts with 'E' — 7,330 rows.
SELECT * FROM employees
WHERE last_name LIKE 'E';

SELECT last_name FROM employees
WHERE last_name LIKE ('E%')
   OR last_name LIKE ('%E');

SELECT * FROM employees
WHERE last_name LIKE 'e%e';

#4. Find all employees with a 'q' in their last name — 1,873 rows.
SELECT * FROM employees
WHERE last_name LIKE '%qu%'
AND NOT LIKE '%qu%';