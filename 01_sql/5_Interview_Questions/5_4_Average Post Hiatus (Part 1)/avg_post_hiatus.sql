-- Solution 1 (with CTE - Common Table Expression):

WITH user_posts_2021 AS (
  SELECT
    user_id,
    MIN(post_date) AS first_post,
    MAX(post_date) AS last_post,
    COUNT(post_id) AS post_count
  FROM posts
  WHERE EXTRACT(YEAR FROM post_date) = 2021
  GROUP BY user_id
)
SELECT
  user_id,
  DATE_PART('day', last_post - first_post) AS days_between
FROM user_posts_2021
WHERE post_count >= 2;


-- Solution 2:

SELECT
  user_id,
  MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id) >1
;
