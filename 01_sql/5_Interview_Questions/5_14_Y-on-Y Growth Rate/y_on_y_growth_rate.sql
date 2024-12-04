-- Solution

with yearly_spend_cte as (
  SELECT
    extract(year from transaction_date) as year,
    product_id,
    spend as curr_year_spend,
    Lag(spend,1) Over (
      PARTITION BY product_id
      ORDER by
        product_id,
        transaction_date) as prev_year_spend
  FROM user_transactions
)

SELECT
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  round(100*(curr_year_spend-prev_year_spend)/prev_year_spend,2) as yoy
From yearly_spend_cte
;

-- Solution 2 (Unotimized)
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

-- Solution 2 (Optimized)


WITH yearly_spend_cte AS (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend AS curr_year_spend,
    LAG(spend,1) OVER (
      PARTITION BY product_id
      ORDER BY product_id, transaction_date
    ) AS prev_year_spend
  FROM user_transactions
)

SELECT
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(
    100 * (curr_year_spend - prev_year_spend) / NULLIF(prev_year_spend, 0),
    2
  ) AS yoy_rate
FROM yearly_spend_cte;
