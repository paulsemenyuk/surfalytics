-- Solution

-- Solution by ChatGPT

WITH monthly_opens AS (
    SELECT
        ticker,
        TO_CHAR(date, 'Mon-YYYY') AS month_year,  -- PostgreSQL style
        EXTRACT(YEAR FROM date) AS yr,
        EXTRACT(MONTH FROM date) AS mn,
        MAX(open) AS monthly_max_open
    FROM stock_prices
    WHERE ticker IN ('AAPL','AMZN','GOOG','META','NFLX')  -- FAANG set
    GROUP BY
        ticker,
        EXTRACT(YEAR FROM date),
        EXTRACT(MONTH FROM date),
        TO_CHAR(date, 'Mon-YYYY')
)
