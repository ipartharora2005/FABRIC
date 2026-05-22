# Challenge 03 — Running Total & Employee Sales Rank

**Difficulty:** ⭐⭐⭐ Intermediate
**Concepts:** Window Functions, RANK(), SUM() OVER, PARTITION BY

## Problem
For each employee, calculate:
1. Their **total sales revenue**
2. Their **rank** among all employees by revenue (1 = highest)
3. A **running total** of revenue ordered by rank

Return: `employee_name`, `total_revenue`, `sales_rank`, `running_total`

## Tables Used
`employees` → `orders` → `order_details`

## Expected Output
| employee_name | total_revenue | sales_rank | running_total |
|---|---|---|---|
| Margaret Peacock | 232890.85 | 1 | 232890.85 |
| Janet Leverling | 202812.84 | 2 | 435703.69 |
| ... | ... | ... | ... |

## Hints
- Aggregate revenue per employee first (use a CTE or subquery)
- Apply `RANK()` and `SUM() OVER (ORDER BY ...)` on top of that
- `CONCAT(first_name, ' ', last_name)` for full name
