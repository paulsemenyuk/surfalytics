-- Solution

SELECT
    customer_name,
    COUNT(DISTINCT activity) AS distinct_activities
FROM
    rentals
GROUP BY
    customer_name
HAVING
    COUNT(DISTINCT activity) > 1;
