-- SELECT statement

-- select all (*) columns from table
SELECT * FROM employees;
SELECT * FROM shops;
SELECT * FROM locations;
SELECT * FROM suppliers;

--===================================================

-- WHERE clause + AND & OR

-- Select only the employees who make more than 50k
SELECT *
FROM employees
WHERE salary > 50000;

-- Select only the employees who work in Common Grounds coffeshop
SELECT *
FROM employees
WHERE coffeeshop_id = 1;

-- Select all the employees who work in Common Grounds and make more than 50k
SELECT *
FROM employees
WHERE salary > 50000 AND coffeeshop_id = 1;

-- Select all the employees who work in Common Grounds or make more than 50k
SELECT *
FROM employees
WHERE salary > 50000 OR coffeeshop_id = 1;

-- Select all the employees who work in Common Grounds, make more than 50k and are male
SELECT *
FROM employees
WHERE
	salary > 50000
	AND coffeeshop_id = 1
	AND gender = 'M';

-- Select all the employees who work in Common Grounds or make more than 50k or are male
SELECT *
FROM employees
WHERE
	salary > 50000
	OR coffeeshop_id = 1
	OR gender = 'M';

--=======================================================

-- IN, NOT IN, IS NULL, BETWEEN

-- Select all rows from the suppliers table where the supplier is Beans and Barley
SELECT *
FROM suppliers
WHERE supplier_name = 'Beans and Barley';

-- Select all rows from the suppliers table where the supplier is NOT Beans and Barley
SELECT *
FROM suppliers
WHERE NOT supplier_name = 'Beans and Barley';

SELECT *
FROM suppliers
WHERE supplier_name <> 'Beans and Barley';

-- Select all Robusta and Arabica coffee types
SELECT *
FROM suppliers
WHERE coffee_type IN ('Robusta', 'Arabica');

SELECT *
FROM suppliers
WHERE
	coffee_type = 'Robusta'
	OR coffee_type = 'Arabica';

-- Select all coffee types that are not Robusta or Arabica
SELECT *
FROM suppliers
WHERE coffee_type NOT IN ('Robusta', 'Arabica');

-- Select all employees with missing email addresses
SELECT *
FROM employees
WHERE email IS NULL;

-- Select all employees whose emails are not missing
SELECT *
FROM employees
WHERE NOT email IS NULL;

-- Select all employees who make between 35k and 50k
SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM employees
WHERE salary BETWEEN 35000 AND 50000

--===========================================================

-- ORDER BY, LIMIT, DISTINCT, Renaming columns

-- Order by salary ascending 
SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM employees
ORDER BY salary;

-- Order by salary descending 
SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM employees
ORDER BY salary DESC;

-- Top 10 highest paid employees
SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM employees
ORDER BY salary DESC
LIMIT 10;

-- Return all unique coffeeshop ids
SELECT DISTINCT coffeeshop_id
FROM employees;

-- Return all unique countries
SELECT DISTINCT country
FROM locations;

-- Renaming columns
SELECT
	email,
	email AS email_address, 
	hire_date,
  hire_date AS date_joined,
	salary,
  salary AS pay
FROM employees;

--=========================================================

-- EXTRACT

SELECT
	hire_date as date,
	EXTRACT(YEAR FROM hire_date) AS year,
	EXTRACT(MONTH FROM hire_date) AS month,
	EXTRACT(DAY FROM hire_date) AS day
FROM employees;

--=========================================================

-- UPPER, LOWER, LENGTH, TRIM

-- Uppercase first and last names
SELECT
	first_name,
	UPPER(first_name) AS first_name_upper,
	last_name,
	UPPER(last_name) AS last_name_upper
FROM employees;

-- Lowercase first and last names
SELECT
	first_name,
	LOWER(first_name) AS first_name_upper,
	last_name,
	LOWER(last_name) AS last_name_upper
FROM employees;

-- Return the email and the length of emails
SELECT
	email,
	LENGTH(email) AS email_length
FROM employees;

-- TRIM
SELECT
    LENGTH('     HELLO     ') AS hello_with_spaces,
LENGTH('HELLO') AS hello_no_spaces,
    LENGTH(TRIM('     HELLO     ')) AS hello_trimmed;

--=========================================================

