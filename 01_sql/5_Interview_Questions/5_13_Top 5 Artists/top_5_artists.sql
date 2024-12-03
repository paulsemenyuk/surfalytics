-- SImplified SOlution

With top_10_cte as (
  SELECT
    a.artist_name,
    DENSE_RANK() OVER (
     ORDER BY count(s.song_id) DESC) as artist_rank
  FROM artists as a
  INNER JOIN songs as s
    on a.artist_id=s.artist_id
  INNER JOIN global_song_rank as g
    on s.song_id=g.song_id
  where g.rank <= 10
  group by a.artist_name
  )
SELECT
  artist_name,
  artist_rank
FROM top_10_cte
WHERE artist_rank <= 5
;

-- Solution


WITH Top10Songs AS (
    SELECT
        g.song_id
    FROM
        global_song_rank g
    WHERE
        g.rank <= 10
),
ArtistSongCount AS (
    SELECT
        s.artist_id,
        COUNT(*) AS top_10_count
    FROM
        Top10Songs t
    JOIN
        songs s
    ON
        t.song_id = s.song_id
    GROUP BY
        s.artist_id
),
ArtistRanking AS (
    SELECT
        a.artist_name,
        sc.top_10_count,
        RANK() OVER (ORDER BY sc.top_10_count DESC) AS artist_rank
    FROM
        ArtistSongCount sc
    JOIN
        artists a
    ON
        sc.artist_id = a.artist_id
)
SELECT
    artist_name,
    artist_rank
FROM
    ArtistRanking
WHERE
    artist_rank <= 5
ORDER BY
    artist_rank, artist_name;
