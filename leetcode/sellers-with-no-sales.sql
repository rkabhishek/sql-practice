-- leetcode 1607

-- solution 1 using RIGHT JOIN
SELECT s.seller_name
FROM Orders o
RIGHT JOIN Seller s
ON o.seller_id = s.seller_id
GROUP BY s.seller_id
HAVING SUM(CASE WHEN YEAR(sale_date) = 2020 THEN 1 ELSE 0 END) = 0
ORDER BY s.seller_name;

-- solution 2 using NOT EXISTS
SELECT s.seller_name
FROM Seller s
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE s.seller_id = o.seller_id
    AND YEAR(sale_date) = 2020
)
ORDER BY s.seller_name;

-- solution 3 using LEFT JOIN
-- this doesn't join the entire orders table, but only the sellers which had sales in 2020 and then excludes them
SELECT s.seller_name
FROM Seller s
LEFT JOIN (
    SELECT DISTINCT seller_id
    FROM Orders
    WHERE YEAR(sale_date) = 2020
) o on s.seller_id = o.seller_id
WHERE o.seller_id IS NULL
ORDER BY s.seller_name;
