-- leetcode 1607

-- solution 1 using RIGHT JOIN
SELECT s.seller_name
FROM Orders o
RIGHT JOIN Seller s
ON o.seller_id = s.seller_id
GROUP BY s.seller_id
HAVING SUM(CASE WHEN sale_date BETWEEN '2020-01-01' AND '2020-12-31' THEN 1 ELSE 0 END) = 0
ORDER BY s.seller_name;

-- solution 2 using NOT EXISTS
SELECT s.seller_name
FROM Seller s
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE s.seller_id = o.seller_id
    AND sale_date BETWEEN '2020-01-01' AND '2020-12-31'
)
ORDER BY s.seller_name;
