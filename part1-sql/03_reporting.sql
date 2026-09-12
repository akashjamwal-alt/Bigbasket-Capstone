--Query (a): CASE WHEN revenue tiering
select product_id , sum(amount_inr) AS total_revenue,
CASE
when sum(amount_inr) >= 3000 THEN 'High'
when sum(amount_inr) >= 1000 THEN 'Medium'
ELSE 'low'
END AS revenue_tier
FROM orders 
WHERE status = 'Delivered'
GROUP BY product_id
ORDER BY total_revenue DESC;

--Query (b): Monthly-by-category business report
SELECT p.category,strftime('%Y-%m', o.order_date) AS month,
COUNT(*) AS order_count,
SUM(o.amount_inr) AS total_revenue,
ROUND(AVG(o.amount_inr), 2) AS avg_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category, month
ORDER BY p.category, month;
-- Total rows =36 ,total_revenue =88282

--Query (c): Variance vs category targets
SELECT cr.category,
       cr.total_revenue,
       ct.target_revenue_inr,
       (ct.target_revenue_inr - cr.total_revenue) AS variance,
       ROUND(((cr.total_revenue - ct.target_revenue_inr) * 100.0) / ct.target_revenue_inr, 2) AS percentage_variance,
       CASE
         WHEN cr.total_revenue >= ct.target_revenue_inr THEN 'Above Target'
         WHEN ((ct.target_revenue_inr - cr.total_revenue) * 100.0) / ct.target_revenue_inr <= 15 THEN 'Below Target - Watch'
         ELSE 'Below Target - Critical'
       END AS status_tag
FROM (
  SELECT p.category, SUM(o.amount_inr) AS total_revenue
  FROM orders o
  JOIN products p ON o.product_id = p.product_id
  WHERE o.status = 'Delivered'
  GROUP BY p.category
) cr
JOIN category_targets ct ON cr.category = ct.category
ORDER BY percentage_variance;
-- Result: 6 rows — 3 Above Target, 2 Below Target - Critical, 1 Below Target - Watch.