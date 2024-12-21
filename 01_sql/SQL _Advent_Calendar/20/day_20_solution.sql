select
    distinct vendor_name
from
    vendors v
join
    item_prices i
on
    v.vendor_id=i.vendor_id
where
    price_usd < 10;
