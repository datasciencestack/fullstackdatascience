/* 
1. NUMERIC TYPES: INT, TINYINT, SMALLINT, BIGINT, DECIMAL, FLOAT, DOUBLE
	INT			    for employeeid, customerid or other unique
    TINYINT		    availabilityOfParkingSpace (0 for unavilable, 1 for available)
    SMALLINT		num of seats in an auditorium
    BIGINT		    population of a country
	DECIMAL(10,2)	total price of shopping cart
    FLOAT(8,4)		temperature reading from a weather station
    DOUBLE(15,8)	latitude and longitude coordinates of a location
    
2. CHARACTER STRING TYPES: VARCHAR, CHAR, TEXT
	VARCHAR(255)	 		  	names of customers
    CHAR(3) => FIXED LENGTH  	"USA", "WHO"
    TEXT =>LARGE TEXT	      	content of a blog post or article
    ENUM 					  	storing status of an order ('Pending','Processing','Shipped',Delivered')

3. DATA AND TIME TYPES: DATE, TIME, DATETIME, TIMESTAMP, YEAR
	DATE	  => YYYY-MM-DD						DOB 
    TIME	  => HH:MM:SS						duration of a movie
    DATETIME  => YYYY-MM-DD HH:MM:SS			user login timestamp
    TIMESTAMP => SPECIFIED POINT IN TIME		timestamp of a record modification (AUTOUPDATE WHEN THERE IS CHANGE IN THAT RECORD)
    YEAR 	  => YYYY
    
4. BOOLEAN TYPE: BOOLEAN
	BOOLEAN	=> TRUE or FALSE					product is in-stock (true), or out-of-stock (false)
	
5. BINARY TYPES: BINARY, VARBINARY, BLOB
	BINARY			FIXED LENGTH BINARY ENCRYPTION KEY
    VARBINARY		VARIABLE LENGTH BINARY DATA: IMAGES OR FILES
    BLOB			LARGE BINARY OBJECTS LIKE IMAGE OR DOCUMENT

6. OTHER TYPES: JSON, SET
	JSON			JSON DOC OF CONFIG SETTINGS OBJECT (A PYTHON DICTIONERY IS AN EXAMPLE)
    SET				FIXED SET OF OPTIONS OF USER

*/
DROP DATABASE IF EXISTS DATATYPES;
CREATE DATABASE DATATYPES;
USE DATATYPES;

-- INT
CREATE TABLE employees (
  id INT,
  age INT,
  salary INT
);

INSERT INTO employees (id, age, salary)
VALUES (1, 30, 5000);

SELECT * FROM EMPLOYEES;

-- SMALLINT
CREATE TABLE students (
  id INT,
  age SMALLINT,
  grade SMALLINT
);

INSERT INTO students (id, age, grade)
VALUES (1, 15, 9);

SELECT * FROM STUDENTS;

-- TINYINT
CREATE TABLE parking_spaces (
  id INT,
  available TINYINT
);

INSERT INTO parking_spaces (id, available)
VALUES (1, 1);

SELECT * FROM PARKING_SPACES;

-- BIGINT
CREATE TABLE countries (
  id BIGINT,
  population BIGINT
);

INSERT INTO countries (id, population)
VALUES (1, 328200000);

SELECT * FROM countries;

-- DECIMAL
CREATE TABLE products (
  id INT, 
  price DECIMAL(10,2)
);

INSERT INTO products (id, price)
VALUES (1, 29.99);

SELECT * FROM products;

-- FLOAT
CREATE TABLE temperatures (
  id INT,
  value FLOAT
);

INSERT INTO temperatures (id, value)
VALUES (1, 23.5);

SELECT * FROM temperatures;

-- DOUBLE
CREATE TABLE locations (
  id INT,
  latitude DOUBLE,
  longitude DOUBLE
);

INSERT INTO locations (id, latitude, longitude)
VALUES (1, 40.7128, -74.0060);

SELECT * FROM locations;

-- CHAR
CREATE TABLE countries2 (
  id INT,
  country_code CHAR(2)
);

INSERT INTO countries2 (id, country_code)
VALUES (1, 'US');

SELECT * FROM countries2;

-- VARCHAR
CREATE TABLE customers (
  id INT,
  name VARCHAR(50)
);

INSERT INTO customers (id, name)
VALUES (1, 'John Doe');

SELECT * FROM customers;

-- TEXT
CREATE TABLE posts (
  id INT,
  content TEXT
);

INSERT INTO posts (id, content)
VALUES (1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.');

SELECT * FROM POSTS;

-- ENUM
CREATE TABLE orders (
  id INT,
  status ENUM('Pending', 'Processing', 'Shipped', 'Delivered')
);

INSERT INTO orders (id, status)
VALUES (1, 'Shipped');

SELECT * FROM ORDERS;

-- DATE
CREATE TABLE employees (
  id INT,
  hire_date DATE
);

INSERT INTO employees (id, hire_date)
VALUES (1, '2021-06-15');

SELECT * FROM EMPLOYEES;

-- TIME
CREATE TABLE tasks (
  id INT,
  duration TIME
);

INSERT INTO tasks (id, duration)
VALUES (1, '02:30:00');

SELECT * FROM TASKS;

-- DATETIME
CREATE TABLE events (
  id INT,
  event_name VARCHAR(50),
  event_datetime DATETIME
);

INSERT INTO events (id, event_name, event_datetime)
VALUES (1, 'Meeting', '2023-06-19 09:30:00');

SELECT * FROM EVENTS;

-- TIMESTAMP
CREATE TABLE logs (
  id INT,
  log_time TIMESTAMP
);

INSERT INTO logs (id, log_time)
VALUES (1, CURRENT_TIMESTAMP);


SELECT * FROM LOGS;

-- YEAR
CREATE TABLE products (
  id INT,
  year_released YEAR
);

INSERT INTO products (id, year_released)
VALUES (1, 2022);

SELECT * FROM PRODUCTS;

-- BOOLEAN
CREATE TABLE tasks (
  id INT,
  completed BOOLEAN
);

INSERT INTO tasks (id, completed)
VALUES (1, TRUE);

SELECT * FROM TASKS;

-- BLOB
CREATE TABLE images (
  id INT,
  data BLOB
);

-- USE PROGRAMMING LANGUAGES AND CONNECT TO MYSQL AND READ THE FILE INTO BINARY FORMAT AND INSERT INTO DATABASE


-- JSON
CREATE TABLE products2 (
  id INT,
  details JSON
);

INSERT INTO products2 (id, details)
VALUES (1, '{"name": "Product 1", "price": 10.99, "category": "Electronics"}');

SELECT * FROM PRODUCTS2;


-- SET
CREATE TABLE users (
  id INT,
  hobbies SET('Reading', 'Sports', 'Music', 'Travel')
);

INSERT INTO users (id, hobbies)
VALUES (1, 'Reading');

-- Error Code: 1265. Data truncated for column 'hobbies' at row 1
INSERT INTO users (id, hobbies)
VALUES (1, 'Listening');

select * from users;

