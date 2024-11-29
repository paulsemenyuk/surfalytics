# Task: Analyze Concert Revenue Data

As the lead data analyst for a prominent music event management company, you have been entrusted with a dataset containing concert revenue and detailed information about various artists.

Your mission is to unlock valuable insights by analyzing the concert revenue data and identifying the top revenue-generating artists within each music genre.

## Objective:
Write a query to rank the artists within each genre based on their revenue per member and extract the top revenue-generating artist from each genre. Display the output of the artist name, genre, concert revenue, number of members, and revenue per band member, sorted by the highest revenue per member within each genre.

---

## **Concerts Schema**

| Column Name         | Type         | Description                                                                 |
|---------------------|--------------|-----------------------------------------------------------------------------|
| `artist_id`         | integer      | A unique identifier for each artist or band performing in the concert.     |
| `artist_name`       | varchar(100) | The name of the artist or band performing in the concert.                  |
| `genre`             | varchar(50)  | The music genre associated with the concert.                               |
| `concert_revenue`   | integer      | The total revenue generated from the concert.                              |
| `year_of_formation` | integer      | The year that the artist or band was formed.                               |
| `country`           | varchar(50)  | The country of origin or residence of the artist or band.                  |
| `number_of_members` | integer      | The number of members in the band.                                         |
| `album_released`    | integer      | The total number of albums released by the artist or band.                 |
| `label`             | varchar(100) | The record label or music company associated with the artist or band.      |

---

## **Concerts Example Input**

| artist_id | artist_name   | genre  | concert_revenue | year_of_formation | country        | number_of_members | album_released | label               |
|-----------|---------------|--------|-----------------|-------------------|----------------|-------------------|----------------|---------------------|
| 103       | Taylor Swift  | Pop    | 700000          | 2004              | United States  | 1                 | 9              | Republic Records    |
| 104       | BTS           | K-Pop  | 800000          | 2013              | South Korea    | 7                 | 7              | Big Hit Music       |
| 105       | Adele         | Pop    | 600000          | 2006              | United Kingdom | 1                 | 3              | Columbia Records    |
| 109       | Blackpink     | K-Pop  | 450000          | 2016              | South Korea    | 4                 | 5              | YG Entertainment    |
| 110       | Maroon 5      | Pop    | 550000          | 1994              | United States  | 6                 | 10             | Interscope Records  |

---

## Solution
Step 1: Calculating Revenue per Member and Ranking Concerts within Each Genre

In both solutions, we calculate the revenue generated per band member for each concert and rank the artists within each genre based on their revenue per member.

Solution #1: Using CTE

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

SELECT *
FROM ranked_concerts_cte;
Solution #2: Using Subquery

SELECT
  artist_name,
  concert_revenue,
  genre,
  number_of_members,
  concert_revenue / number_of_members AS revenue_per_member,
  RANK() OVER (
    PARTITION BY genre
    ORDER BY concert_revenue / number_of_members DESC) AS ranked_concerts
FROM concerts;
Step 2: Selecting the Top Revenue-Generating Artists within Each Genre

In both solutions, we use either CTE or subquery results to extract the top revenue-generating artists in each music genre.

Solution #1: Using CTE

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
Solution #2: Using Subquery

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

Interpreting the results:

Beyonce earned a staggering $750,000 in revenue with 1 member, resulting in a revenue per member of $750,000. She holds the top spot in the R&B genre.
Ariana Grande secured the top position in the Pop genre, generating $720,000 in concert revenue with 1 member, resulting in a revenue per member of $720,000.
Eminem takes the lead in the Hip-Hop genre, amassing $620,000 in concert revenue with 1 member, leading to a revenue per member of $620,000.
