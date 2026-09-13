# BigBasket Capstone Project

## Overview
This project builds a small, deterministic BigBasket-style database and
analyzes category revenue against monthly targets using SQL. The same
findings are cross-checked in a spreadsheet, visualized in a Tableau
dashboard, and independently validated by cleaning a messy raw data
export in Python/Pandas.

## Repo Structure
- `generate_data.py` — regenerates the database (see below)
- `monthly_category_revenue.csv` — locked export (repo root), input for Parts 2–3
- `DATA_STORY.md` — dashboard interpretation and recommendations
- `part1-sql/` — SQL queries and supporting files
  - `01_foundations.sql` — foundational SQL queries
  - `02_aggregation_joins.sql` — joins, aggregation, HAVING
  - `03_reporting.sql` — CASE WHEN tiering, monthly report, variance
  - `ai_log.md` — AI-assisted prompting log
  - `bigbasket_capstone.db` — the SQLite database
  - `verify.sql` — row-count verification
  - `orders_raw.csv`, `products.csv` — messy raw exports (Part 4 only)
- `part2/` — spreadsheet cross-check workbook
  - `bigbasket_spreadsheet_crosscheck.xlsx` — Part 2 workbook

## How to Regenerate the Database
```bash
python3 generate_data.py
```
Uses a fixed random seed (42), so output is fully reproducible.

## Part 3 — Tableau Dashboard
Live interactive dashboard (Tableau Public, no login required):
https://public.tableau.com/app/profile/akash.singh4527/viz/BigBasketCategoryDashboard/SummaryDashboard

## Data Story
See [`DATA_STORY.md`](./DATA_STORY.md) for category-by-category tier
status and recommendations for the category team.

## Part 4 — Python/Pandas Notebook
*(To be added)*

## AI-Assisted Prompting Log
See [`part1-sql/ai_log.md`](./part1-sql/ai_log.md)
