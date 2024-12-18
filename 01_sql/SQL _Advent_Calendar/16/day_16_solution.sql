-- Solution

select
    category,
    sum(quantity_sold*price_per_unit) as total_revenue
from
    candy_sales
group by
    category;
