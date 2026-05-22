# SQL Analytics Playground 🗃️

A curated set of SQL challenges using the **Northwind** dataset — covering JOINs, aggregations, window functions, CTEs, query optimization, and real-world finance scenarios.

![CI](https://github.com/ipartharora2005/FABRIC/actions/workflows/test.yml/badge.svg)

---

## Challenges

| # | Topic | Concepts | Difficulty |
|---|---|---|---|
| 01 | Top Customers by Revenue | JOIN, GROUP BY, ORDER BY | ⭐ |
| 02 | Monthly Revenue Trend | DATE_TRUNC, Aggregations | ⭐⭐ |
| 03 | Employee Sales Rank | RANK(), SUM() OVER, Window Fns | ⭐⭐⭐ |
| 04 | Customer Segmentation | CTEs, CASE WHEN | ⭐⭐⭐ |
| 05 | Query Optimization | JOIN vs IN vs EXISTS | ⭐⭐⭐⭐ |
| 06 | Debtor Ageing Report | Finance Logic, Date Arithmetic | ⭐⭐⭐⭐⭐ |

---

## Run Locally

### Option 1 — Docker (recommended)
```bash
# Start Postgres with Northwind preloaded
docker-compose up -d

# Run all solution tests
pip install psycopg2-binary pytest
pytest challenges/validate_solutions.py -v
```

### Option 2 — Existing Postgres
```bash
psql -U postgres -c "CREATE DATABASE northwind;"
psql -U postgres -d northwind -f datasets/northwind_setup.sql

export DB_URL=postgresql://postgres:yourpassword@localhost:5432/northwind
pytest challenges/validate_solutions.py -v
```

---

## Dataset
**Northwind** — Microsoft's classic sample database covering customers, orders, products, employees, and suppliers.

Loaded from: [pthom/northwind_psql](https://github.com/pthom/northwind_psql)

---

## Stack
- PostgreSQL 15
- Python 3.11
- pytest
- GitHub Actions CI
