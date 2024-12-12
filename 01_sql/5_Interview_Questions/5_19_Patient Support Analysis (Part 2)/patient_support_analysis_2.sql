-- My Soultion

WITH cte_uncategorised_callers AS (
  SELECT
    COUNT(case_id) AS total_calls,
    SUM(
      CASE
        WHEN call_category LIKE 'n/a' OR call_category IS NULL THEN 1
        ELSE 0
      END
    ) AS no_category
  FROM callers
)
SELECT
  ROUND(
    no_category::NUMERIC / total_calls * 100, 1
  ) AS uncategorised_call_pct
FROM cte_uncategorised_callers;

-- Solution 2

WITH uncategorised_callers AS (
  SELECT COUNT(case_id) AS uncategorised_calls
  FROM callers
  WHERE call_category IS NULL
    OR call_category = 'n/a'
)

SELECT
  ROUND(100.0 * uncategorised_calls
    / (SELECT COUNT(*) FROM callers), 1) AS uncategorised_call_pct
FROM uncategorised_callers;
