DROP DATABASE IF EXISTS VIEWS;

CREATE DATABASE VIEWS;
USE VIEWS;

-- VIEW (VIRTUAL TABLE TO HIDE SENSITIVE DATA OR STORE COMPLEX QUERIES RESULT)

CREATE TABLE EMPLOYEES
(
	E_ID int PRIMARY KEY,
	E_NAME varchar(20),
	E_SALARY INT,
	D_ID  CHAR(4)
);

CREATE TABLE DEPARTMENTS
(
	D_ID CHAR(4) PRIMARY KEY,
	D_NAME varchar(20),
	E_ID  INT
);

INSERT INTO EMPLOYEES (E_ID, E_NAME, E_SALARY, D_ID)
VALUES (1, 'John Doe', 5000, 'D001'),
		(2, 'Jane Smith', 6000, 'D002'),
		(3, 'Michael Johnson', 4500, 'D001'),
        (4, 'Sarah Johnson', 5500, 'D003'),
        (5, 'Robert Davis', 4800, 'D002'),
        (6, 'Emily Wilson', 5200, 'D001');
        
INSERT INTO DEPARTMENTS (D_ID, D_NAME, E_ID)
VALUES ('D001', 'Sales', 1), 
		('D002', 'Marketing', 2),
		('D003', 'Finance', 3),
        ('D004', 'HR', 4),
        ('D005', 'Operations', 5),
        ('D006', 'IT', 6);


ALTER TABLE EMPLOYEES
ADD FOREIGN KEY (D_ID) REFERENCES DEPARTMENTS(D_ID);

ALTER TABLE DEPARTMENTS
ADD FOREIGN KEY (E_ID) REFERENCES EMPLOYEES(E_ID);

select * from departments;
select * from employees;

-- CREATE A VIEW
CREATE VIEW employee_details AS
SELECT E_ID, E_NAME, E_SALARY, D_ID
FROM employees 
where e_salary > 5000;

-- QUERYING VIEW
SELECT * FROM employee_details;

-- UPDATING DATA THROUGH VIEW

UPDATE employee_details
SET E_salary = E_salary + 50000
WHERE D_ID = 'D001';

-- view data updation affects original table data
SELECT * FROM EMPLOYEE_DETAILS;
SELECT * FROM EMPLOYEES;

-- DROPPING A VIEW
DROP VIEW employee_details;

-- ------------------------------------------------------------------

-- creating view from multiple tables data
CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT,
  total_amount DECIMAL(10, 2)
);

CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO orders (id, customer_id, total_amount)
VALUES (1, 1, 100.00),
       (2, 2, 200.00);

INSERT INTO customers (id, name)
VALUES (1, 'John Doe'),
       (2, 'Jane Smith');

CREATE VIEW order_view AS
SELECT o.id as order_id, c.name AS customer_name, o.total_amount as order_amount
FROM orders o
JOIN customers c 
ON o.customer_id = c.id;

select * from customers;
select * from orders;

select * from order_view;

-- updating view (created from multiple tables)
UPDATE order_view
SET order_amount = 150.00
WHERE order_id = 1;


-- --------------------------------------------------------
drop table if exists employees, departments;

CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  department_id INT,
  salary DECIMAL(10, 2)
);

CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50)
);

INSERT INTO employees (id, name, department_id, salary)
VALUES (1, 'John Doe', 1, 5000),
       (2, 'Jane Smith', 2, 6000);

INSERT INTO departments (department_id, department_name)
VALUES (1, 'HR'),
       (2, 'Operations');

CREATE VIEW employee_department_view AS
SELECT e.id, e.name, d.department_name, e.salary, e.salary*0.05 as bonus
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

select * from employees;
select * from departments;

select * from employee_department_view;

UPDATE employee_department_view
SET bonus = salary * 0.15
WHERE id = 1;
-- Error Code: 1348. Column 'bonus' is not updatable
-- as bonus is a calculated column and not present directly in the underlying table

UPDATE employee_department_view
SET salary = salary + 1
WHERE id = 1;
-- salary value is updated successfully as salary column is present in underlying table

select * from employee_department_view;
select * from employees;
