-- Solution

select
    delivery_date,
    sum (gifts_delivered) over (
        order by delivery_date
    ) as gifts_delivered
from
   deliveries;
