-- Solution usung CTE and CASE

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


-- Solution usung FILTER clause (only PostgreSQL and SQLite)

SELECT
  ab.age_bucket,
  ROUND(100.0 *
    SUM(a.time_spent) FILTER (WHERE a.activity_type = 'send')/
    SUM(a.time_spent),2) AS send_perc,
  ROUND(100.0 *
    SUM(a.time_spent) FILTER (WHERE a.activity_type = 'open')/
    SUM(a.time_spent),2) AS open_perc
FROM activities
INNER JOIN age_breakdown AS ab
  ON a.user_id = ab.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY ab.age_bucket;
