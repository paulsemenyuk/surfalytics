-- Solution

select
    f.name,
    count (p.child_id) as total_number_of_children
from
    family_members f
join
    parent_child_relationships p
on
    f.member_id=p.parent_id
group by
    f.name
order by
    count (p.child_id) desc
limit 3;
