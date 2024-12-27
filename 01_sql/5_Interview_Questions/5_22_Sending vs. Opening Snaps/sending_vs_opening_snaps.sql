-- Solution

WITH cte as (
  SELECT
    ab.age_bucket,
    SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) as sent_sum,
    SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) as open_sum
  FROM activities a
  JOIN age_breakdown ab
    ON a.user_id = ab.user_id
  GROUP BY
    ab.age_bucket
)
SELECT
  age_bucket,
  ROUND(sent_sum / NULLIF(sent_sum + open_sum, 0) * 100.0, 2) as send_perc,
  ROUND(open_sum / NULLIF(sent_sum + open_sum, 0) * 100.0, 2) as open_perc
FROM cte
ORDER BY age_bucket;
