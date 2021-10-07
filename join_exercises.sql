USE employees;

#repharse question in terms of tables and columns in your database.

#2.Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager' FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE to_date >= NOW();

SELECT * FROM dept_manager;

#3.Find the name of all departments currently managed by women.
SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager' FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date >= NOW()
AND e.gender = 'F'
ORDER BY d.dept_name;

#4. Find the current titles of employees currently working in the Customer Service department.
SELECT t.titles AS 'Title', COUNT(t.title) AS 'Total' FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN titles t ON t.emp_no = de.emp_no
WHERE dm.to_date >= NOW()
AND e.gender = 'F'
ORDER BY d.dept_name;

#Start by getting all the titles for everyone in Customer Service:
SELECT title FROM titles t
JOIN dept_emp de ON t.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service';

# Next, clump the titles together. I can use GROUP BY ... or I can use SELECT DISTINCT ... but if I use DISTINCT I won't be able to use COUNT later on.
SELECT title FROM titles t
JOIN dept_emp de ON t.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service'
GROUP BY t.title;

#Now you have to get the COUNT of how many people have those titles. This would no work had I chosen SELECT DISTINCT
SELECT title, COUNT(title) FROM titles t
JOIN dept_emp de ON t.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service'
GROUP BY t.title;

#Now limit it to current title-holders
SELECT title, COUNT(title) FROM titles t
JOIN dept_emp de ON t.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service'
AND t.to_date = '9999-01-01'
GROUP BY t.title;

#Still showing too many query results so we have to add an extra AND with de.to_date;
SELECT title, COUNT(title) FROM titles t
JOIN dept_emp de ON t.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service'
AND t.to_date = '9999-01-01'
AND de.to_date = '9999-01-01'
GROUP BY t.title;

#5. Find the current salary of all current managers.
SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager', s.salary AS 'Salary' FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e on dm.emp_no = e.emp_no
JOIN salaries s on e.emp_no = s.emp_no
WHERE dm.to_date >= NOW()
AND s.to_date >= NOW()
ORDER BY d.dept_name;


#Javier's Solution to question 5.
SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager', salary AS 'Salary' FROM salaries s
JOIN dept_manager dm on s.emp_no = dm.emp_no
JOIN employees e on e.emp_no = dm.emp_no
JOIN departments d on d.dept_no = dm.dept_no
WHERE s.to_date LIKE '9%'
AND dm.to_date LIKE '9%'
ORDER BY dept_name;

# BONUS:  Find the names of all current employees, their department name, and their current manager's name.

SELECT CONCAT(first_name, ' ', last_name) AS Employee FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date LIKE '9%';

