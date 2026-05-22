WITH employee_revenue AS (
    SELECT
        CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
        ROUND(SUM(od.unit_price * od.quantity)::NUMERIC, 2) AS total_revenue
    FROM employees e
    JOIN orders o ON e.employee_id = o.employee_id
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY e.first_name, e.last_name
)
SELECT
    employee_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS sales_rank,
    ROUND(SUM(total_revenue) OVER (ORDER BY total_revenue DESC)::NUMERIC, 2) AS running_total
FROM employee_revenue
ORDER BY sales_rank;
