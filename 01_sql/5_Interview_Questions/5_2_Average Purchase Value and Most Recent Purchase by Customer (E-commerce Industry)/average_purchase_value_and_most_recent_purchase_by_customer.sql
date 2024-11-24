--- Solution:

SEELECT
    customer_id,
    AVG(purchase_amount) as AVG_purchs,
    MAX(purchase_date) as recent_purchase
FROM purchases
GROUP BY customer_id
ORDER BY AVG_purchs DESC
