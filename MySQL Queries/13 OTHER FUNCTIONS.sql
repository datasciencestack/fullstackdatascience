DROP DATABASE IF EXISTS WINDOW_FUNCTIONS;

CREATE DATABASE WINDOW_FUNCTIONS;
USE WINDOW_FUNCTIONS;

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  department_id INT,
  salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary)
VALUES
  (1, 'John', 'Doe', 1, 5000),
  (2, 'Jane', 'Smith', 1, 6000),
  (3, 'Robert', 'Johnson', 2, 5500),
  (4, 'Emily', 'Davis', 2, 6500),
  (5, 'Michael', 'Brown', 3, 7000),
  (6, 'Emma', 'Wilson', 3, 8000);

-- Window functions allow performing calculations across a set of rows that are related to the current row. 
-- They are used to calculate aggregations, rankings, and cumulative sums within specific partitions or the entire result set.

-- ROW_NUMBER()
SELECT
  employee_id,
  first_name,
  last_name,
  ROW_NUMBER() OVER (ORDER BY employee_id DESC) AS row_num
FROM
  employees;
  
  SELECT
  employee_id,
  first_name,
  last_name,
  (@row_num := @row_num + 1) AS row_num
FROM
  employees,
  (SELECT @row_num := 100) AS r
ORDER BY employee_id;

SELECT
  employee_id,
  first_name,
  last_name,
  salary,
  ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num, -- Assigns a unique number to each row within a result set, based on the specified order.
  RANK() OVER (ORDER BY salary DESC) AS rank_num, -- Assigns a unique rank to each row within a result set, with ties receiving the same rank, but leaving gaps.
  DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_num, -- Assigns a unique rank to each row within a result set, with ties receiving the same rank, without leaving gaps.
  NTILE(4) OVER (ORDER BY salary DESC) AS ntile_num -- Divides the result set into a specified number of groups (buckets) and assigns a group number to each row.
FROM
  employees;


--  ------------------------------------------------------

-- statistical functions

CREATE TABLE sales (
  id INT PRIMARY KEY,
  product VARCHAR(50),
  quantity INT,
  price DECIMAL(10, 2)
);

INSERT INTO sales (id, product, quantity, price)
VALUES
  (1, 'Product A', 10, 100.00),
  (2, 'Product B', 5, 75.50),
  (3, 'Product C', 8, 120.75),
  (4, 'Product A', 15, 95.25),
  (5, 'Product B', 12, 80.50),
  (6, 'Product C', 6, 110.25);

-- Average quantity
SELECT AVG(quantity) AS average_quantity FROM sales;

-- Total sales
SELECT SUM(quantity * price) AS total_sales FROM sales;

-- Count of sales
SELECT COUNT(*) AS total_sales_count FROM sales;

-- Minimum price
SELECT MIN(price) AS min_price FROM sales;

-- Maximum price
SELECT MAX(price) AS max_price FROM sales;

-- Standard deviation of price
SELECT STDDEV(price) AS price_stddev FROM sales;

-- Variance of quantity
SELECT VARIANCE(quantity) AS quantity_variance FROM sales;

-- Correlation between quantity and price
-- error: SELECT CORR(quantity, price) AS quantity_price_corr FROM sales

SELECT 
  (SUM(x * y) - COUNT(*) * AVG(x) * AVG(y)) / 
  (SQRT((SUM(x * x) - COUNT(*) * AVG(x) * AVG(x)) * (SUM(y * y) - COUNT(*) * AVG(y) * AVG(y))))
  AS correlation_coefficient
FROM (
  SELECT quantity AS x, price AS y
  FROM sales
) AS subquery;



-- Population covariance between quantity and price
-- error: SELECT COVAR_POP(quantity, price) AS quantity_price_covar_pop FROM sales;
SELECT 
  SUM((x - avg_x) * (y - avg_y)) / COUNT(*) AS covariance
FROM (
  SELECT 
    quantity AS x,
    price AS y,
    (SELECT AVG(quantity) FROM sales) AS avg_x,
    (SELECT AVG(price) FROM sales) AS avg_y
  FROM sales
) AS subquery;


-- Sample covariance between quantity and price
-- error: SELECT COVAR_SAMP(quantity, price) AS quantity_price_covar_samp FROM sales;

SELECT 
  SUM((x - avg_x) * (y - avg_y)) / (COUNT(*) - 1) AS covariance
FROM (
  SELECT 
    quantity AS x,
    price AS y,
    (SELECT AVG(quantity) FROM sales) AS avg_x,
    (SELECT AVG(price) FROM sales) AS avg_y
  FROM sales
) AS subquery;


-- --------------------------------------------------------

-- ML FUNCTIONS
-- 1. Data Preparation
-- 2. Feature Extraction
-- 3. Training Data Preparation
-- 4. Model Storage and Deployment
-- 5. Predictions

-- Data Preparation:

-- Cleaning data:
SELECT REPLACE(review, '.', '') AS cleaned_review
FROM customer_reviews;

-- Tokenization:
SELECT SUBSTRING_INDEX(review, ' ', 1) AS first_word
FROM customer_reviews;

-- Stop word removal:
SELECT review
FROM customer_reviews
WHERE review NOT LIKE '%the%' AND review NOT LIKE '%is%' AND review NOT LIKE '%and%';


-- Feature Extraction:

-- Calculate word frequency:
SELECT word, COUNT(*) AS frequency
FROM words_table
GROUP BY word;

-- Calculate TF-IDF:
SELECT word, COUNT(*) AS word_count, (COUNT(*) / total_reviews) AS term_frequency,
       LOG(total_reviews / COUNT(*)) AS inverse_document_frequency,
       (COUNT(*) / total_reviews) * LOG(total_reviews / COUNT(*)) AS tfidf
FROM words_table
GROUP BY word;

-- Training Data Preparation:

-- Split data into training and testing sets:
-- Training set
SELECT * 
FROM customer_reviews
ORDER BY RAND()
LIMIT 80;
-- Testing set
SELECT *
FROM customer_reviews
ORDER BY RAND()
LIMIT 20;

-- Model Storage and Deployment:

-- Train a machine learning model: 

-- Use Python with scikit-learn or any other machine learning library to train the sentiment analysis model. 
-- Then, store the model parameters in a MySQL table.

-- Store the model in MySQL:
CREATE TABLE sentiment_model (
  model_id INT PRIMARY KEY,
  model_parameters TEXT
);

INSERT INTO sentiment_model (model_id, model_parameters)
VALUES (1, 'Serialized model parameters');

-- Predictions:

-- Retrieve the model from MySQL:
SELECT model_parameters
FROM sentiment_model
WHERE model_id = 1;

-- Apply the model to new data:
SELECT review, sentiment_score
FROM customer_reviews
JOIN sentiment_model ON customer_reviews.review_id = sentiment_model.review_id
WHERE sentiment_score > 0.5;



