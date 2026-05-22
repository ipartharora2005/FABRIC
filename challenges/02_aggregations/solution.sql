SELECT
    TO_CHAR(o.order_date, 'YYYY-MM') AS order_month,
    ROUND(SUM(od.unit_price * od.quantity)::NUMERIC, 2) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
ORDER BY order_month ASC;
