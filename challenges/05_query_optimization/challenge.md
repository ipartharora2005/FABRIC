# Challenge 05 — Optimize a Slow Query

**Difficulty:** ⭐⭐⭐⭐ Advanced
**Concepts:** Query Optimization, Correlated Subquery → JOIN rewrite, EXISTS vs IN

## Problem
The query below works but is **slow** — it uses a correlated subquery that runs once per row.

**Slow version (do NOT use this):**
```sql
SELECT company_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE order_id IN (
        SELECT order_id
        FROM order_details
        WHERE unit_price > 100
    )
);
```

**Your task:** Rewrite this using JOINs or EXISTS to make it faster.
Then write a second version using `EXISTS` and explain which is better and why (in a comment).

## Expected Output
List of unique customer names who have ordered at least one product priced over $100.

## Hints
- Correlated subqueries re-execute for every row in the outer query
- JOIN or EXISTS lets the engine optimize with indexes
- Add `-- EXPLAIN:` comment at the bottom with your reasoning
