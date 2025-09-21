-- leetcode 1164

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


