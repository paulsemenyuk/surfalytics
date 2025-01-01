-- Solution

-- Solution by ChatGPT

, extremes AS (
    SELECT
        ticker,
        month_year,
        monthly_max_open,
        MAX(monthly_max_open) OVER (PARTITION BY ticker) AS overall_high,
        MIN(monthly_max_open) OVER (PARTITION BY ticker) AS overall_low
    FROM monthly_opens
)
SELECT
    e.ticker,
    MAX(CASE WHEN e.monthly_max_open = e.overall_high THEN e.month_year END) AS highest_mth,
    MAX(CASE WHEN e.monthly_max_open = e.overall_high THEN e.monthly_max_open END) AS highest_open,
    MAX(CASE WHEN e.monthly_max_open = e.overall_low  THEN e.month_year END) AS lowest_mth,
    MAX(CASE WHEN e.monthly_max_open = e.overall_low  THEN e.monthly_max_open END) AS lowest_open
FROM extremes e
GROUP BY
    e.ticker
ORDER BY
    e.ticker;
