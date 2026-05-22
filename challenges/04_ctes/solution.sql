WITH customer_revenue AS (
    SELECT
        c.company_name AS customer_name,
        c.country,
        ROUND(SUM(od.unit_price * od.quantity)::NUMERIC, 2) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY c.company_name, c.country
),
customer_tiers AS (
    SELECT
        customer_name,
        country,
        total_revenue,
        CASE
            WHEN total_revenue > 50000  THEN 'Platinum'
            WHEN total_revenue > 20000  THEN 'Gold'
            WHEN total_revenue > 5000   THEN 'Silver'
            ELSE 'Bronze'
        END AS tier
    FROM customer_revenue
)
SELECT *
FROM customer_tiers
ORDER BY total_revenue DESC;
