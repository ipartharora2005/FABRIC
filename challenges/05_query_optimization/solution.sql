-- VERSION 1: Rewrite with JOINs (faster than nested IN subqueries)
SELECT DISTINCT c.company_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
WHERE od.unit_price > 100
ORDER BY c.company_name;


-- VERSION 2: Rewrite with EXISTS (often fastest for existence checks)
SELECT c.company_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    WHERE o.customer_id = c.customer_id
      AND od.unit_price > 100
)
ORDER BY c.company_name;


-- EXPLAIN:
-- Original: nested IN subqueries = correlated execution, O(n * m * k) scans.
-- JOIN version: engine builds hash joins, single pass with index support. Better for large sets.
-- EXISTS version: short-circuits on first match per customer — best when most customers qualify.
-- In PostgreSQL, EXISTS is generally preferred for "does at least one row exist" checks.
-- Use EXPLAIN ANALYZE to verify: EXISTS typically shows fewer rows examined.
