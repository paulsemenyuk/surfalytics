-- Solution

-- Solution using Window Function

WITH freq AS (
    SELECT
        item_count,
        order_occurrences,
        MAX(order_occurrences) OVER () AS max_occ
    FROM items_per_order
)
SELECT item_count AS mode
FROM freq
WHERE order_occurrences = max_occ
ORDER BY item_count ASC;

-- Solution from ChatGPT

SELECT
    item_count AS mode
FROM items_per_order
WHERE order_occurrences = (
    SELECT MAX(order_occurrences)
    FROM items_per_order
)
ORDER BY item_count ASC;
