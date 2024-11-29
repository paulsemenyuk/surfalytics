SELECT
  EXTRACT(month from submit_date) as mnth,
  product_id as product,
  ROUND(AVG(stars),2) as avg_stars
 FROM reviews
GROUP BY mnth, product
ORDER BY mnth;
