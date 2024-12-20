-- SOlution

WITH polar_cte AS (
    SELECT
        pb.bear_name,
        MAX(ml.food_weight_kg) AS largest_single_meal_kg
    FROM polar_bears AS pb
    JOIN meal_log AS ml
        ON pb.bear_id = ml.bear_id
    WHERE
        ml.date >= '2024-12-01'
        AND ml.date < '2025-01-01'
    GROUP BY
        pb.bear_name
)
SELECT
    bear_name,
    largest_single_meal_kg
FROM polar_cte
ORDER BY largest_single_meal_kg DESC;
