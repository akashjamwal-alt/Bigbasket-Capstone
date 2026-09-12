--WHERE
SELECT customer_id, name, city, signup_date
FROM customers
WHERE city = 'Mumbai';
--result-> 13 rows returned with city as Mumbai

--DISTINCT
SELECT DISTINCT category
FROM products; 
--result-> 6  DISTINCT category 

--ORDER BY + LIMIT
SELECT order_id, amount_inr
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;
--result -> 5 rows returned, with  and amount_inr

--Alias    
SELECT count(*) AS total_rows
FROM orders;
--Result: total_rows -> 500

--IN
SELECT order_id, payment_mode, amount_inr
FROM orders
WHERE payment_mode IN ('UPI', 'Wallet');
--result -> 215 rows

--BETWEEN/ Not BETWEEN
SELECT order_id, amount_inr 
FROM orders 
WHERE amount_inr BETWEEN 500 AND 1000;
--Result-> 27 rows returned

SELECT order_id, amount_inr 
FROM orders 
WHERE amount_inr NOT BETWEEN 500 AND 1000;
--Result-> 473 rows returned

--Null check
SELECT order_id, status, rating 
FROM orders 
WHERE rating IS NULL;
--Result->66 rows returned 

--not NULL
SELECT order_id, status, rating 
FROM orders 
WHERE rating IS NOT NULL;
--result-> 434 ROWS