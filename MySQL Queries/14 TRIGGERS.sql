DROP DATABASE IF EXISTS TRIGGERS;

CREATE DATABASE TRIGGERS;
USE TRIGGERS;


-- Create the orders table
CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  total_amount DECIMAL(10, 2),
  order_date DATE
);

-- Create the order_logs table to store the change logs
CREATE TABLE order_logs (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  action VARCHAR(50),
  log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a trigger to insert a log record when a new order is inserted
DELIMITER //
CREATE TRIGGER trg_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
  INSERT INTO order_logs (order_id, action)
  VALUES (NEW.id, 'New order inserted');
END//
DELIMITER ;

-- Create a trigger to insert a log record when an order is updated
DELIMITER $$
CREATE TRIGGER trg_order_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
  INSERT INTO order_logs (order_id, action)
  VALUES (NEW.id, 'Order updated');
END $$
DELIMITER ;


INSERT INTO orders (id, customer_name, total_amount, order_date)
VALUES (1, 'John Doe', 100.00, '2022-01-01');

INSERT INTO orders (id, customer_name, total_amount, order_date)
VALUES (2, 'Jane Smith', 200.00, '2022-02-01');


SELECT * FROM order_logs;

UPDATE orders
SET total_amount = 150.00
WHERE id = 1;

SELECT * FROM order_logs;


