-- Solution #1: Using CTE

WITH ranked_concerts_cte AS (
  SELECT
    artist_name,
    concert_revenue,
    genre,
    number_of_members,
    concert_revenue / number_of_members AS revenue_per_member,
    RANK() OVER (
      PARTITION BY genre
      ORDER BY concert_revenue / number_of_members DESC) AS ranked_concerts
  FROM concerts
)

SELECT
  artist_name,
  concert_revenue,
  genre,
  number_of_members,
  revenue_per_member
FROM ranked_concerts_cte
WHERE ranked_concerts = 1
ORDER BY revenue_per_member DESC;

-- Solution #2: Using Subquery

SELECT
  artist_name,
  concert_revenue,
  genre,
  number_of_members,
  revenue_per_member
FROM (
  -- Subquery Result
  SELECT
    artist_name,
    concert_revenue,
    genre,
    number_of_members,
    concert_revenue / number_of_members AS revenue_per_member,
    RANK() OVER (
      PARTITION BY genre
      ORDER BY concert_revenue / number_of_members DESC) AS ranked_concerts
  FROM concerts) AS subquery
WHERE ranked_concerts = 1
ORDER BY revenue_per_member DESC;
