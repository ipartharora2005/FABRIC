# Challenge 01 — Top Customers by Revenue

**Difficulty:** ⭐ Beginner
**Concepts:** JOIN, GROUP BY, ORDER BY, LIMIT

## Problem
Find the **top 5 customers** by total revenue (`unit_price × quantity`).
Return: `customer_name`, `total_revenue` (rounded to 2 decimal places).
Sort by highest revenue first.

## Tables Used
`customers` → `orders` → `order_details`

## Expected Output
| customer_name | total_revenue |
|---|---|
| QUICK-Stop | 110277.31 |
| Ernst Handel | 104874.98 |
| ... | ... |

## Hint
Revenue per line item = `unit_price * quantity`. JOIN all 3 tables, then aggregate.
