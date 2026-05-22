# Challenge 06 — Debtor Ageing Buckets (Real World Finance)

**Difficulty:** ⭐⭐⭐⭐⭐ Advanced
**Concepts:** CASE WHEN, DATE arithmetic, Window Functions, Business Logic

## Problem
Simulate a **Debtor Ageing Report** — a core finance dashboard used in AR (Accounts Receivable).

Using the Northwind orders data, treat **unshipped orders** (`shipped_date IS NULL`) as "outstanding invoices".
Calculate how many days each order has been outstanding (from `order_date` to today).
Then bucket each order into ageing brackets:

| Bucket | Days Outstanding |
|---|---|
| Current | 0–30 days |
| 31–60 Days | 31–60 days |
| 61–90 Days | 61–90 days |
| 90+ Days | > 90 days |

Return: `customer_name`, `order_id`, `order_date`, `order_value`, `days_outstanding`, `ageing_bucket`
Sort by `days_outstanding` DESC.

## Bonus
Add a summary aggregation at the end: total outstanding value per ageing bucket.

## Tables Used
`customers` → `orders` → `order_details`

## Hints
- `CURRENT_DATE - o.order_date::DATE` gives days outstanding
- Filter: `WHERE o.shipped_date IS NULL`
- Use CASE WHEN on days_outstanding for bucket assignment
- For the bonus: wrap in a CTE and GROUP BY ageing_bucket
