-- Solution

SELECT
  manufacturer,
  COUNT(drug) as drug_count,
  ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC;


-- First unsuccessful attempt

/*SELECT
  DISTINCT manufacturer,
  COUNT(drug) as drug_count,
  total_sales - cogs as total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC;*/

-- calculate total loss
-- output:
--    manufacturer,
--    number of drugs (total_sales - cogs <= 0),
--    absolute value of total loss
-- ORDER BY total_loss DESC
