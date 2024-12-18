-- Solution

select
    recipient,
    sum (weight_kg)
from
    gifts
group by
    recipient
