-- leetcode 1607

SELECT s.seller_name
FROM Orders o
RIGHT JOIN Seller s
ON o.seller_id = s.seller_id
GROUP BY s.seller_id
HAVING SUM(CASE WHEN sale_date BETWEEN '2020-01-01' AND '2020-12-31' THEN 1 ELSE 0 END) = 0
ORDER BY s.seller_name;
