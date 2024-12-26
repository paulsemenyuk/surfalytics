-- Solution

WITH ranked_transactions AS (
  SELECT
    user_id,
    spend,
    transaction_date,
    RANK() OVER (ORDER BY transaction_date) AS rank -- alternative is to use ROW_NUMBER()
  FROM transactions
)
SELECT *
FROM ranked_transactions
WHERE rank = 3;

-- Solution Using Subquery

SELECT
  user_id,
  spend,
  transaction_date
FROM (
  SELECT
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER (
      PARTITION BY user_id ORDER BY transaction_date) AS row_num
  FROM transactions) AS trans_num
WHERE row_num = 3;
