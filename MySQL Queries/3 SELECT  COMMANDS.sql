
USE COMPANY;
SHOW TABLES;

-- SELECT ALL THE COLUMNS
SELECT * FROM CUSTOMERS;

-- SELECT SPECIFIC COLUMNS
SELECT FIRST_NAME, COUNTRY FROM CUSTOMERS;

-- USING ALIAS FOR COLUMN NAMES
SELECT FIRST_NAME AS 'Employee Name', COUNTRY AS 'Employee Country' FROM CUSTOMERS;

SELECT * FROM CUSTOMERS;

INSERT INTO CUSTOMERS 
VALUES (4,'JEEVAN', 'SHARMA', 'INDIA');
 
INSERT INTO CUSTOMERS 
VALUES 
(2,'TONY', 'ROBBINS', 'INDIA'),
(3,'JAVD', 'BASHA', 'PAKISTAN'),
-- (4,'JEEVAN', 'SHARMA', 'INDIA'), 
(5,'RAMU', NULL, 'NEPAL'),
(6,'RAVI', 'SHARMA', 'UK'),
(7,'REKA', 'VANI', 'INDIA');

-- FETCH THE FIRST NAME AND COUNTRY FROM CUSTOMERS
SELECT FIRST_NAME, COUNTRY FROM CUSTOMERS;

-- WHERE IS USED TO FILTER ROWS FROM THE DATASET
-- DISPLAY EMPLOYEES BELONGING TO INDIA ORIGINAL TABLE IS NOT AFFECTED
SELECT * FROM CUSTOMERS 
WHERE COUNTRY = 'INDIA';

SELECT * FROM CUSTOMERS 
WHERE COUNTRY <> 'INDIA';

-- LIKE
SELECT * FROM CUSTOMERS 
WHERE FIRST_NAME LIKE 'R%';

-- LIKE WITH AND
SELECT * FROM CUSTOMERS 
WHERE FIRST_NAME LIKE 'J%' AND LAST_NAME LIKE '%A';

SELECT * FROM CUSTOMERS 
WHERE FIRST_NAME LIKE '_A%';

-- LIKE WITH NOT
SELECT * FROM CUSTOMERS 
WHERE COUNTRY NOT LIKE 'I%';

-- CHECKING MISSING DATA: IS NULL, IS NOT NULL
SELECT * FROM CUSTOMERS 
WHERE LAST_NAME IS NULL;

SELECT * FROM CUSTOMERS 
WHERE LAST_NAME IS NOT NULL;

-- LOGICAL OPERATORS: AND, OR, NOT
SELECT * FROM CUSTOMERS 
WHERE LAST_NAME IS NOT NULL
AND CUSTOMERID < 3;

SELECT * FROM CUSTOMERS 
WHERE LAST_NAME IS NULL
OR CUSTOMERID < 3;

-- RELATIONAL OPERATORS
SELECT * FROM CUSTOMERS WHERE CUSTOMERID = 3;
SELECT * FROM CUSTOMERS WHERE CUSTOMERID < 3;
SELECT * FROM CUSTOMERS WHERE CUSTOMERID > 3;
SELECT * FROM CUSTOMERS WHERE CUSTOMERID <= 3;
SELECT * FROM CUSTOMERS WHERE CUSTOMERID >= 3;
SELECT * FROM CUSTOMERS WHERE CUSTOMERID <> 3;

-- ORDER BY CLAUSE (NO EFFECT ON OPRIGINAL DATA)
SELECT * FROM CUSTOMERS 
ORDER BY COUNTRY ASC;

SELECT * FROM CUSTOMERS 
WHERE CUSTOMERID < 5
ORDER BY COUNTRY;

SELECT * FROM CUSTOMERS 
WHERE CUSTOMERID < 5
ORDER BY COUNTRY DESC; -- ORDER BY COMES AFTER WHERE CLAUSE (IF ANY)

-- LIMIT/OFFSET CLAUSE
SELECT * FROM CUSTOMERS LIMIT 4; -- FRIST 4 ROWS

SELECT * FROM CUSTOMERS
WHERE CUSTOMERID < 7
ORDER BY CUSTOMERID DESC -- 6 ROWS
LIMIT 4 -- TOP 4 ROWS
;

SELECT * FROM CUSTOMERS
WHERE CUSTOMERID < 7
ORDER BY CUSTOMERID DESC -- 6 ROWS
LIMIT 4 
OFFSET 2; -- RETRIVES 4 ROWS SKIPPING FIRST 2 ROWS

-- ARITHMETIC OPERATION ON NUMERICAL COLUMN
SELECT CUSTOMERID+100 FROM CUSTOMERS; -- DOESNOT AFFECT ORIGINAL TABLE

SELECT * FROM CUSTOMERS;

-- MORE ON CLAUSES

USE HR_EMP;
SHOW TABLES;
SELECT * FROM EMPLOYEES;

-- FETCH EMPLOYEE WITH ID 95
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 95;

-- FETCH EMPLOYEE WHOSE NAME IS AMAN
SELECT * FROM EMPLOYEES WHERE FIRST_NAME ='AMAN';

-- FETCH EMPLOYEE WHO WAS HIRED BEFORE 1990 JAN 3RD
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '1990-01-03';

-- FETCH EMPLOYEE IN DEPARTMENT 45
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 45;

-- CHECKING MULTIPLE CONDITIONS
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (70,10);

-- FETCH EMPLOYEES WHOSE FIRST NAMES ARE EITHER 'AKSHAY' OR 'JACK'
SELECT * FROM EMPLOYEES WHERE FIRST_NAME IN ('AKSHAY','JACK');

-- FETCH EMPLOYEES WHOSE BELONG TO EITHER DEPARTMENT 45,22 
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (45,22);


SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID NOT IN (45,22);

-- LIKE AND NOT LIKE

SELECT * FROM EMPLOYEES;

-- LIST EMPLOYEES WHOSE FIRST_NAME BEGIN WITH S
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'S%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'R%';


-- LIST EMPLOYEES WHOSE NAMES END WITH A 'A'
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%A';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%I';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE  '%A_';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE  'S____';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME NOT LIKE '%A';

-- NULL
-- LIST EMPLOYEES WHO DO NOT GET A COMMISSION
SELECT * FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

-- LIST EMPLOYEES WHO GET A COMMISSION

SELECT * FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- COLUMN ALIAS 
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL AS EMAILID FROM EMPLOYEES



;

-- LOGICAL OPERATORS
SELECT * FROM EMPLOYEES WHERE SALARY=8000 AND FIRST_NAME ='ASIM';
SELECT * FROM EMPLOYEES WHERE SALARY=9000 AND FIRST_NAME ='ASIM';

SELECT * FROM EMPLOYEES WHERE SALARY=34000 OR  FIRST_NAME ='ASIM';

SELECT * FROM EMPLOYEES;


SELECT * FROM EMPLOYEES WHERE NOT(SALARY=8000);

-- RELATIONAL  OPERATORS
SELECT * FROM EMPLOYEES WHERE SALARY=8000;

-- NOT EQUAL TO 
SELECT * FROM EMPLOYEES WHERE SALARY != 8000;
SELECT * FROM EMPLOYEES WHERE SALARY <> 8000;

SELECT * FROM EMPLOYEES WHERE SALARY < 8000;
SELECT * FROM EMPLOYEES WHERE SALARY <= 8000;


SELECT * FROM EMPLOYEES WHERE SALARY > 8000;
SELECT * FROM EMPLOYEES WHERE SALARY >= 8000;

-- SALARY RANGE

SELECT * FROM EMPLOYEES WHERE SALARY >= 8000 AND SALARY <=9000;
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 8000 AND 9000;

-- ORDER BY CLAUSE
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC;


SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME DESC;


SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC;

SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME , LAST_NAME;

-- LIMIT AND OFFSET 

SELECT * FROM EMPLOYEES 
LIMIT 3;

-- LIST THE EMPLOYEES WHO IS GETTING THE LEAST SALARY
SELECT * FROM EMPLOYEES 
ORDER BY SALARY 
LIMIT 1;

-- LIST THE EMPLOYEES WHO IS GETTING THE HIGHEST SALARY
SELECT * FROM EMPLOYEES 
ORDER BY SALARY DESC
LIMIT 1;


SELECT * FROM EMPLOYEES
LIMIT 2 OFFSET 5
;

SELECT * FROM EMPLOYEES
LIMIT 4 OFFSET 6;

-- ARITHMETIC OPERATIONS

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY *.05 AS BONUS FROM EMPLOYEES;



-- SORTING DATA
SELECT * FROM EMPLOYEES;


-- ORDER BY
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC;


SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME DESC;


SELECT * FROM EMPLOYEES
ORDER BY SALARY;

SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME, LAST_NAME;