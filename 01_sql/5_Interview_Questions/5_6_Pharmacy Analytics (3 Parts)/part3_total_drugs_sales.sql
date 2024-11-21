-- V1

SELECT
  manufacturer,
  CONCAT( '$', ROUND(SUM(total_sales) / 1000000), ' million') AS sales_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer;


-- V2

SELECT
  manufacturer,
  '$'||ROUND(SUM(total_sales)/1000000)||' '||'million' as sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer desc;
