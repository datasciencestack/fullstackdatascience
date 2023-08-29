-- CORELATED SUB-QUERIES


DROP DATABASE IF EXISTS E_COMMERCE;

CREATE DATABASE E_COMMERCE;
USE E_COMMERCE;

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  city VARCHAR(50)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  amount DECIMAL(10,2)
  -- FOREIGN KEY (customer_id) REFERENCES Customers (customer_id) -- WILL ADD LATER
);

INSERT INTO Customers (customer_id, customer_name, city)
VALUES (1, 'John Smith', 'New York'),
       (2, 'Emma Johnson', 'London'),
       (3, 'Michael Brown', 'Los Angeles'),
       (4, 'Sarah Davis', 'Sydney');


INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES (1, 1, '2023-05-01', 100),
       (2, 2, '2023-05-02', 150),
       (3, 3, '2023-05-03', 200),
       (4, 1, '2023-05-04', 75),
       (5, 4, '2023-05-05', 120),
       (6, 3, '2023-05-06', 130),
       (7, 1, '2023-05-06', 250);
       

ALTER TABLE ORDERS
ADD FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID);

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

-- TOTAL AMOUNT FOR EACH CUSTOMER (SUBQUERY RUNS FOR EACH CUSTOMER)
SELECT c.customer_name, 
	(	SELECT SUM(o.amount)
		FROM Orders o
		WHERE o.customer_id = c.customer_id
	) AS total_amount
FROM Customers c;

-- The EXISTS operator is used to test for the existence of any record in a subquery.
-- The EXISTS operator returns TRUE if the subquery returns one or more records.


-- CUSTOMERS WITH ORDER AMOUNT > 120
-- checks amt>200 for each cust
SELECT *
FROM Customers c
WHERE EXISTS (
    SELECT ORDER_ID
    FROM Orders o
    WHERE o.customer_id = c.customer_id
    AND o.amount > 120
);


