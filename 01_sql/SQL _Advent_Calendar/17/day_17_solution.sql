-- Solution

select
    prank_name,
    location
from
    grinch_pranks
where
    difficulty is not 'Beginner';
