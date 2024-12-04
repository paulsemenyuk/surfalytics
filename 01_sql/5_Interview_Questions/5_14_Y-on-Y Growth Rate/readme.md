# Y-on-Y Growth Rate
## Wayfair SQL Interview Question
# Calculate Year-on-Year Growth Rate for Wayfair Transactions

This document provides an SQL solution for calculating the year-on-year growth rate for the total spend of each product, grouped by product ID.

## Table Schema

### `user_transactions` Table:

| Column Name      | Type       |
|-------------------|------------|
| `transaction_id`  | `integer`  |
| `product_id`      | `integer`  |
| `spend`           | `decimal`  |
| `transaction_date`| `datetime` |

## Example Input:

| transaction_id | product_id | spend   | transaction_date     |
|----------------|------------|---------|----------------------|
| 1341           | 123424     | 1500.60 | 12/31/2019 12:00:00 |
| 1423           | 123424     | 1000.20 | 12/31/2020 12:00:00 |
| 1623           | 123424     | 1246.44 | 12/31/2021 12:00:00 |
| 1322           | 123424     | 2145.32 | 12/31/2022 12:00:00 |

## Expected Output:

| year | product_id | curr_year_spend | prev_year_spend | yoy_rate |
|------|------------|-----------------|-----------------|----------|
| 2019 | 123424     | 1500.60         | NULL            | NULL     |
| 2020 | 123424     | 1000.20         | 1500.60         | -33.35   |
| 2021 | 123424     | 1246.44         | 1000.20         | 24.62    |
| 2022 | 123424     | 2145.32         | 1246.44         | 72.12    |

## SQL Solution:

```sql
WITH yearly_spend_cte AS (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS transaction_year,
    product_id,
    SUM(spend) AS curr_year_spend,
    LAG(SUM(spend)) OVER (
      PARTITION BY product_id
      ORDER BY EXTRACT(YEAR FROM transaction_date)
    ) AS prev_year_spend
  FROM user_transactions
  GROUP BY product_id, EXTRACT(YEAR FROM transaction_date)
)

SELECT
  transaction_year AS year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(
    100 * (curr_year_spend - prev_year_spend) / NULLIF(prev_year_spend, 0),
    2
  ) AS yoy_rate
FROM yearly_spend_cte
ORDER BY product_id, year;
