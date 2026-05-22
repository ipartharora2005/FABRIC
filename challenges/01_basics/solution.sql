SELECT
    c.company_name AS customer_name,
    ROUND(SUM(od.unit_price * od.quantity)::NUMERIC, 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.company_name
ORDER BY total_revenue DESC
LIMIT 5;
