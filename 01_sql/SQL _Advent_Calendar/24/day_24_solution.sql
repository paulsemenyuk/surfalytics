-- Solution with Window Function

select
    delivery_date,
    sum (gifts_delivered) over (
        order by delivery_date
    ) as gifts_delivered
from
   deliveries;

-- Solution with self-join

SELECT
    d1.delivery_date,
    d1.gifts_delivered,
    SUM(d2.gifts_delivered) AS cumulative_gifts
FROM deliveries d1
JOIN deliveries d2
    ON d2.delivery_date <= d1.delivery_date
GROUP BY d1.delivery_date, d1.gifts_delivered
ORDER BY d1.delivery_date;

-- Solution with with Correlated Subquery

SELECT
    d1.delivery_date,
    d1.gifts_delivered,
    (
        SELECT SUM(d2.gifts_delivered)
        FROM deliveries d2
        WHERE d2.delivery_date <= d1.delivery_date
    ) AS cumulative_gifts
FROM deliveries d1
ORDER BY d1.delivery_date;
