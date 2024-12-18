-- Solution

SELECT
    globe_name,
    COUNT(f.figurine_id) AS number_of_figurines,
    s.material
FROM
    snow_globes s
JOIN
    figurines f
ON
    s.globe_id = f.globe_id
GROUP BY
    globe_name, s.material
ORDER BY
    number_of_figurines DESC
LIMIT 3;
