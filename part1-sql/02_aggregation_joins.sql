Query (a): INNER JOIN + GROUP BY + HAVING

SELECT p.category,COUNT(*) AS order_count, SUM(o.amount_inr) AS total_revenue, 
ROUND(AVG(o.amount_inr), 2) AS avg_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING total_revenue > 10000
--Result->  (5 of 6 categories pass the filter; Fruits & Vegetables = 9790
--          is correctly excluded since it's below 10000):
--   Household Essentials  | 79 orders | 21715 | 274.87
--   Personal Care         | 66 orders | 16382 | 248.21
--   Bakery                | 67 orders | 15410 | 230.00
--   Dairy & Eggs          | 66 orders | 14090 | 213.48
--   Snacks & Beverages    | 83 orders | 10895 | 131.27

Query (b): LEFT JOIN + count(o.order_id)

SELECT p.product_id, p.product_name, COUNT(o.order_id) AS total_orders
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_orders ASC;

 --Result-> out of 31 rows produced here are 5 top least -ordered (ascending, least-ordered first) - top rows:
--   Premium Face Cream 50g -> 0  (proves LEFT JOIN was used correctly)
--   Shampoo 340ml           -> 3
--   Apple 1kg               -> 6
--   Fruit Juice 1L          -> 7
--   Face Wash 100g          -> 7
ORDER BY total_revenue DESC;