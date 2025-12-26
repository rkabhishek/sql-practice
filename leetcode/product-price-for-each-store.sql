With Store_Price AS (
    SELECT product_id,
    CASE WHEN store = 'store1' THEN price END AS store1,
    CASE WHEN store = 'store2' THEN price END AS store2,
    CASE WHEN store = 'store3' THEN price END AS store3
    FROM Products
)

SELECT product_id, MAX(store1) AS store1, MAX(store2) AS store2, MAX(store3) AS store3
FROM Store_Price
GROUP BY product_id;
