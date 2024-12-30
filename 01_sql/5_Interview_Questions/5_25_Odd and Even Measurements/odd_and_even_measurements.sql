-- Solution with CASE claus

WITH ranked_measurements AS (
  SELECT
    CAST(measurement_time AS DATE) AS measurement_day,
    measurement_value,
    ROW_NUMBER() OVER (
      PARTITION BY CAST(measurement_time AS DATE)
      ORDER BY measurement_time) AS measurement_num
  FROM measurements
)

SELECT
  measurement_day,
  SUM(CASE WHEN measurement_num % 2 = 1 THEN measurement_value ELSE 0 END) AS sum_odd,
  SUM(CASE WHEN measurement_num % 2 = 0 THEN measurement_value ELSE 0 END) AS sum_even
FROM ranked_measurements
GROUP BY measurement_day;
