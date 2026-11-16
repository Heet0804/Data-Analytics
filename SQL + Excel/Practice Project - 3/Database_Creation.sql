CREATE DATABASE IF NOT EXISTS E_COMMERCE;
USE E_COMMERCE;

DROP TABLE IF EXISTS ecommerce_orders;
CREATE TABLE ecommerce_orders (
  order_id INT PRIMARY KEY, customer_id VARCHAR(10), seller_id VARCHAR(10),
  order_date DATE, order_time TIME, city VARCHAR(20), category VARCHAR(30), brand VARCHAR(20),
  quantity INT, unit_price DECIMAL(10,2), discount_pct INT, shipping_fee DECIMAL(6,2),
  order_value DECIMAL(12,2), payment_mode VARCHAR(12), order_status VARCHAR(12),
  cancel_return_reason VARCHAR(30) NULL, delivery_days INT NULL, customer_rating INT NULL,
  sale_event VARCHAR(25)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecommerce_orders.csv'
INTO TABLE ecommerce_orders
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(order_id, customer_id, seller_id, @order_date, order_time, city, category, brand,
 quantity, unit_price, discount_pct, shipping_fee, order_value, payment_mode, order_status,
 @reason, @delivery_days, @rating, sale_event)
SET order_date = IF(SUBSTRING(@order_date,5,1) = '-', @order_date, STR_TO_DATE(@order_date, '%d-%m-%Y')),
    cancel_return_reason = NULLIF(@reason, ''),
    delivery_days = NULLIF(@delivery_days, ''),
    customer_rating = NULLIF(@rating, '');
    
    
SELECT COUNT(*), MIN(order_date), MAX(order_date) FROM ecommerce_orders;   -- 48360, 2025-01-01, 2025-12-31
SELECT order_status, COUNT(*) FROM ecommerce_orders GROUP BY order_status; -- Delivered 40281, Returned 4830, Cancelled 3249
SELECT COUNT(*) FROM ecommerce_orders WHERE customer_rating IS NULL;       -- 10947