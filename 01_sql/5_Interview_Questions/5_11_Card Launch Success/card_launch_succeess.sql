-- If you ask ChatGPT, he will provide this solution.
-- Solution 1:

WITH LaunchMonths AS (
    SELECT
        card_name,
        MIN(issue_year * 100 + issue_month) AS launch_date -- Convert year/month to YYYYMM for comparison
    FROM
        monthly_cards_issued
    GROUP BY
        card_name
),
LaunchData AS (
    SELECT
        m.card_name,
        m.issued_amount
    FROM
        monthly_cards_issued m
    INNER JOIN
        LaunchMonths lm
    ON
        m.card_name = lm.card_name
        AND (m.issue_year * 100 + m.issue_month) = lm.launch_date
)
SELECT
    card_name,
    issued_amount
FROM
    LaunchData
ORDER BY
    issued_amount DESC;


--My optimized solution with Window Function
--Solution 2

SELECT
  DISTINCT card_name,
  FIRST_VALUE(issued_amount) OVER (
    PARTITION BY card_name ORDER BY issue_year, issue_month) AS issued_amount
FROM monthly_cards_issued
order by card_name desc;
