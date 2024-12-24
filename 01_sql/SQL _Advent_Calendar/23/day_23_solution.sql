-- Soultion using Window Function

select
    day_of_month,
    COALESCE(weight - LAG(weight)
    OVER (ORDER BY day_of_month), 0) as daily_weight_change
from
    grinch_weight_log;
