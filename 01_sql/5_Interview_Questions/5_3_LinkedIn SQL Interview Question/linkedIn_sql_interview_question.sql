-- Solution:

SELECT
  p.page_id
FROM pages p
FULL OUTER JOIN page_likes pl
  on p.page_id=pl.page_id
where liked_date is NULL
ORDER BY p.page_id
LIMIT 5;
