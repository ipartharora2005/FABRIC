# Challenge 02 — Monthly Revenue Trend

**Difficulty:** ⭐⭐ Beginner-Intermediate
**Concepts:** DATE_TRUNC, GROUP BY, ORDER BY, Aggregations

## Problem
Calculate **total revenue per month** across all orders.
Return: `order_month` (formatted as `YYYY-MM`), `monthly_revenue`, `total_orders`.
Sort by month ascending.

## Tables Used
`orders` → `order_details`

## Expected Output
| order_month | monthly_revenue | total_orders |
|---|---|---|
| 1996-07 | 27861.90 | 22 |
| 1996-08 | 25485.28 | 25 |
| ... | ... | ... |

## Hint
Use `TO_CHAR(o.order_date, 'YYYY-MM')` to format the month.
COUNT DISTINCT order_ids for total_orders.
