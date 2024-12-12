-- My Soultion

WITH count_cte AS (
  SELECT
    policy_holder_id,
    COUNT(case_id) AS calls
  FROM
    callers
  WHERE
    call_duration_secs > 0
  GROUP BY
    policy_holder_id
  ORDER BY
    policy_holder_id
)
SELECT
  COUNT(policy_holder_id) AS count
FROM
  count_cte
WHERE
  calls >= 3;

-- Alternative with HAVING

WITH count_cte AS (
  SELECT
    policy_holder_id,
    COUNT(case_id) AS calls
  FROM
    callers
  WHERE
    call_duration_secs > 0
  GROUP BY
    policy_holder_id
  HAVING
      COUNT(case_id) >= 3
  ORDER BY
    policy_holder_id
)
SELECT
  COUNT(policy_holder_id) AS count
FROM
  count_cte
;
