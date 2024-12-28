-- Solution (optimized)

SELECT
  ROUND(
  COUNT(texts.email_id)::DECIMAL
    /COUNT(DISTINCT emails.email_id),2)
  AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action = 'Confirmed';

  -- Solution with CTE

WITH cte AS (
  SELECT
    COUNT(DISTINCT emails.user_id) AS total_users,
    COUNT(texts.text_id) AS conf_users
  FROM emails
  LEFT JOIN texts
    ON emails.email_id = texts.email_id
      AND texts.signup_action = 'Confirmed'
)
SELECT
  ROUND(conf_users::DECIMAL / NULLIF(total_users, 0), 2) AS confirm_rate
FROM cte;
