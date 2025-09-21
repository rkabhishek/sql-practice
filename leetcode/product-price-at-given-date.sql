-- leetcode 1164

-- solution 1 by first adding initial values with UNION and then using window function to pick latest price
WITH Product_Data_With_Initial_Values AS (
    SELECT
        DISTINCT p.product_id,
        10 AS new_price,
        m.min_change_date - INTERVAL 1 DAY AS change_date
    FROM Products p
    CROSS JOIN (
        SELECT MIN(change_date) AS min_change_date FROM Products
    ) m

    UNION

    SELECT *
    FROM Products
)

SELECT t.product_id, t.new_price AS price
FROM (
    SELECT
        product_id, new_price, change_date,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS row_num
    FROM Product_Data_With_Initial_Values
    WHERE change_date <= '2019-08-16'
) t
WHERE t.row_num = 1;


-- solution 2 using COALESCE (no need for UNION)
WITH Price_History_Ranked AS (
    SELECT
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS row_num
    FROM Products
    WHERE change_date <= '2019-08-16'
)

SELECT p.product_id, COALESCE(h.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id FROM Products
) p
LEFT JOIN Price_History_Ranked h
ON p.product_id = h.product_id
AND h.row_num = 1;
