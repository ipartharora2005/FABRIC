-- PART 1: Order-level ageing detail
WITH outstanding_orders AS (
    SELECT
        c.company_name AS customer_name,
        o.order_id,
        o.order_date,
        ROUND(SUM(od.unit_price * od.quantity)::NUMERIC, 2) AS order_value,
        (CURRENT_DATE - o.order_date::DATE) AS days_outstanding
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    WHERE o.shipped_date IS NULL
    GROUP BY c.company_name, o.order_id, o.order_date
),
aged AS (
    SELECT
        customer_name,
        order_id,
        order_date,
        order_value,
        days_outstanding,
        CASE
            WHEN days_outstanding <= 30  THEN 'Current (0-30)'
            WHEN days_outstanding <= 60  THEN '31-60 Days'
            WHEN days_outstanding <= 90  THEN '61-90 Days'
            ELSE '90+ Days'
        END AS ageing_bucket
    FROM outstanding_orders
)
SELECT * FROM aged
ORDER BY days_outstanding DESC;


-- PART 2 (Bonus): Summary by ageing bucket
WITH outstanding_orders AS (
    SELECT
        o.order_id,
        ROUND(SUM(od.unit_price * od.quantity)::NUMERIC, 2) AS order_value,
        (CURRENT_DATE - o.order_date::DATE) AS days_outstanding
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    WHERE o.shipped_date IS NULL
    GROUP BY o.order_id, o.order_date
),
aged AS (
    SELECT
        order_value,
        CASE
            WHEN days_outstanding <= 30  THEN 'Current (0-30)'
            WHEN days_outstanding <= 60  THEN '31-60 Days'
            WHEN days_outstanding <= 90  THEN '61-90 Days'
            ELSE '90+ Days'
        END AS ageing_bucket
    FROM outstanding_orders
)
SELECT
    ageing_bucket,
    COUNT(*) AS invoice_count,
    ROUND(SUM(order_value)::NUMERIC, 2) AS total_outstanding
FROM aged
GROUP BY ageing_bucket
ORDER BY
    CASE ageing_bucket
        WHEN 'Current (0-30)' THEN 1
        WHEN '31-60 Days'     THEN 2
        WHEN '61-90 Days'     THEN 3
        ELSE 4
    END;
