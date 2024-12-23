-- Solution

select
    distinct g.guest_name
from
    guests g
left join
    guest_gifts gg
on
    g.guest_id=gg.guest_id
where
    gift_name is null
;
