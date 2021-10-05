USE employees;

SELECT DISTINCT title FROM titles;

# List the first 10 distinct last name sorted in descending order.

SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE 'z%'
ORDER BY last_name DESC
LIMIT 10;


SELECT emp_no, salary FROM salaries
ORDER BY salary DESC
    LIMIT 5 OFFSET 45;
