-- Solution

select
    prank_name,
    location
from
    grinch_pranks
where
    difficulty is not 'Beginner'
order by
    prank_name desc, location desc;


-- Solution 2

select
    prank_name,
    location
from
    grinch_pranks
where
    difficulty = 'Advanced' or difficulty = 'Expert'
order by
    prank_name desc, location desc;
