# Challenge 04 — Customer Segmentation with CTEs

**Difficulty:** ⭐⭐⭐ Intermediate
**Concepts:** CTEs, CASE WHEN, Multi-step logic

## Problem
Segment customers into tiers based on their total lifetime revenue:
- **Platinum** → revenue > 50,000
- **Gold** → revenue 20,000–50,000
- **Silver** → revenue 5,000–20,000
- **Bronze** → revenue < 5,000

Return: `customer_name`, `country`, `total_revenue`, `tier`
Sort by total_revenue DESC.

## Tables Used
`customers` → `orders` → `order_details`

## Expected Output
| customer_name | country | total_revenue | tier |
|---|---|---|---|
| QUICK-Stop | Germany | 110277.31 | Platinum |
| Ernst Handel | Austria | 104874.98 | Platinum |
| ... | ... | ... | ... |

## Hints
- CTE 1: calculate revenue per customer
- CTE 2 (or inline CASE): assign tier based on revenue
- Chain CTEs with commas: `WITH cte1 AS (...), cte2 AS (...)`
