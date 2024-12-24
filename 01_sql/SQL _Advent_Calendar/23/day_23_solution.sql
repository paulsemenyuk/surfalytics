-- Soultion using Window Function

select
    day_of_month,
    COALESCE(weight - LAG(weight)
    OVER (ORDER BY day_of_month), 0) as daily_weight_change
from
    grinch_weight_log;


-- Solution 2 using self-join

SELECT
    today.day_of_month,
    coalesce((today.weight - yesterday.weight),0) AS daily_change
FROM grinch_weight_log AS today
LEFT JOIN grinch_weight_log AS yesterday -- you can also remove 'COALESCE' and use INNER JOIN insted, but lose day 1
    ON today.day_of_month = yesterday.day_of_month + 1
ORDER BY today.day_of_month;
