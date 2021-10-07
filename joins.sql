# SELECT COUNT(emp_no) FROM salaries;
# SELECT COUNT(emp_no) FROM employees;

#Join or inner join

# SELECT employees.emp_no, CONCAT(first_name, ' ', last_name) AS 'Full Name', salary, from_date, to_date
# FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;

#MySQL, go through the employees table, retrieve the emp_no, and for each emp_no you retrieve from the employees table, search through the salaries table and look for matching emp_no values. When you find a match, retrieve the emp_no from the employees table, the first_name and last_name from the employees table, concatenated, the salary from the salaries table, the from_date from the salaries table, and to_date from the salaries table, and display them to me in one row.      (BELOW)

# SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name', s.salary, s.from_date,
# s.to_date FROM employees e JOIN salaries s ON e.emp_no = s.emp_no;


# =========================================================================
# Left Join aka Left Outer Join

CREATE DATABASE join_test_db;

USE join_test_db;

CREATE TABLE roles (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   PRIMARY KEY (id)
);

DROP TABLE IF EXISTS users;

CREATE TABLE users (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   role_id INT UNSIGNED DEFAULT NULL,
   PRIMARY KEY (id),
   FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
     ('bob', 'bob@example.com', 1),
     ('joe', 'joe@example.com', 2),
     ('sally', 'sally@example.com', 3),
     ('adam', 'adam@example.com', 3),
     ('jane', 'jane@example.com', null),
     ('mike', 'mike@example.com', null);

#showed all values except null values
SELECT users.name, roles.name FROM roles JOIN users ON roles.id = users.role_id;



#including all values with null, it joins values on the left table to the right table even if their value is null
#If its is said as "user LEFT JOIN roles', users is the left table and roles is the right table
#MySQL, go through the users table, find all the role_id values, for each role_id value, go through the roles table and try to find matching id values. When you find a match, retrieve the values of the name columns for me. (So far, that's the same as a regular join).
#Also, retrieve any names from the users table (that is, the left table) that have no match in the right table, and display those too.

SELECT users.name, roles.name FROM users LEFT JOIN roles ON roles.id = users.role_id;

# =========================================================================

#RIGHT JOIN
#MySQL, go through the users table, find all the role_id values, for each role_id value, go through the roles table and try to find matching id values. When you find a match, retrieve the values of the name columns for me. (So far, that's the same as a regular join).
#Also, retrieve any names from the users table (that is, the right table) that have no match in the left table, and display those too.

SELECT users.name, roles.name FROM users RIGHT JOIN roles ON roles.id = users.role_id;

# =========================================================================
#Exercises
INSERT INTO users (name, email, role_id) VALUES
('albert', 'albert@example.com', 2),
('anthony', 'anthony@example.com', 2),
('nico', 'nico@example.com', 2),
('nacho', 'nacho@example.com', NULL);

SELECT * FROM users;

#JOIN
SELECT users.name, roles.name FROM roles JOIN users ON roles.id = users.role_id;

#LEFT JOIN
SELECT users.name, roles.name FROM users LEFT JOIN roles ON roles.id = users.role_id;

#creating another role
INSERT INTO roles(name) VALUE ('agent');



#RIGHT JOIN (to see the roles assigned)
SELECT users.name, roles.name FROM users RIGHT JOIN roles ON roles.id = users.role_id;

#UPDATING user nacho to value of role 'agent'
UPDATE users SET role_id = 5 WHERE name = 'nacho';

#shows roles and number of users with that role
SELECT roles.name AS role, COUNT(users.name) AS 'users with role' FROM users RIGHT JOIN roles on roles.id = users.role_id GROUP BY roles.name ORDER BY COUNT(users.name);

#shows how many of each role there are
SELECT COUNT(users.name) AS 'users with role', roles.name FROM users RIGHT JOIN roles ON roles.id = users.role_id GROUP BY roles.name;

#shows count of users
SELECT COUNT(users.name) FROM users;

#shows table with all roles next to name of user with that role
SELECT roles.name, users.name FROM roles JOIN users ON roles.id = users.role_id;