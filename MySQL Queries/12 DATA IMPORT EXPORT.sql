DROP DATABASE IF EXISTS DATA_IO;

CREATE DATABASE DATA_IO;
USE DATA_IO;

CREATE TABLE employees (
  ID INT PRIMARY KEY,
  Experience_Years INT,
  Age INT,
  Gender VARCHAR(10),
  Salary BIGINT
);

-- Importing Data from a CSV File:
LOAD DATA INFILE 'G:/My Drive/Data Science Stack/MySQL/Employee_data.csv'
INTO TABLE Employees
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*
TO SOLVE 'Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement'

EXECUTE
SHOW VARIABLES LIKE 'secure_file_priv';

PUT FILES IN THAT FOLDER AND USE THE DISPLAYED PATH FOR FILE INPUT OR OUTPUT
*/
SHOW VARIABLES LIKE 'secure_file_priv'; -- 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\'

-- Importing Data from a CSV File:
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employee_data.csv'
INTO TABLE Employees
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM EMPLOYEES;

-- Exporting Data to a CSV File:
SELECT ID, Experience_Years, SALARY
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employee_data_output.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM EMPLOYEES
WHERE SALARY < 100000;


-- TO GET COLUMN HEADERS IN THE OUTPUT FILE
SELECT 'ID', 'Experience_Years', 'Salary'
UNION ALL
SELECT ID, Experience_Years, SALARY
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employee_data_output2.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM EMPLOYEES
WHERE SALARY < 100000;

-- MOVING INTO CLAUSE 
SELECT 'ID', 'Experience_Years', 'Salary'
UNION ALL
SELECT ID, Experience_Years, SALARY
FROM EMPLOYEES
WHERE SALARY < 100000
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employee_data_output3.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
