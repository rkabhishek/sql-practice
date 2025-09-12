-- leetcode 1571

SELECT w.name AS warehouse_name, SUM(w.units * sub.product_volume) AS volume
FROM Warehouse w LEFT JOIN (
    SELECT
        p.product_id,
        p.width * p.length * p.height AS product_volume
    FROM Products p
) sub
ON w.product_id = sub.product_id
GROUP BY w.name;
