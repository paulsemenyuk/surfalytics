-- My Soulution

with cte1 as (
  SELECT
    category,
    product,
    SUM(spend) AS total_spend,
    Rank () OVER (
      PARTITION BY category
      order by SUM(spend) desc) AS ranking
  FROM product_spend
  where EXTRACT(year from transaction_date) = 2022
  GROUP BY category, product
)

SELECT
  category,
  product,
  total_spend
from cte1
where ranking <3
order by category, total_spend DESC;

-- ChatGPT's Solution

WITH ProductTotals AS (
    SELECT
        category,
        product,
        SUM(spend) AS total_spend
    FROM
        product_spend
    WHERE
        YEAR(transaction_date) = 2022
    GROUP BY
        category, product
),
RankedProducts AS (
    SELECT
        category,
        product,
        total_spend,
        RANK() OVER (PARTITION BY category ORDER BY total_spend DESC) AS rank
    FROM
        ProductTotals
)
SELECT
    category,
    product,
    total_spend
FROM
    RankedProducts
WHERE
    rank <= 2
ORDER BY
    category, total_spend DESC;
