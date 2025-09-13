-- leetcode 1511

WITH Spending_Customers AS (
    SELECT o.customer_id
    FROM Product p
    JOIN Orders o
    ON p.product_id = o.product_id
    WHERE YEAR(o.order_date) = 2020 AND MONTH(o.order_date) IN (6, 7)
    GROUP BY o.customer_id
    HAVING SUM(CASE WHEN MONTH(o.order_date) = 6 THEN o.quantity * p.price ELSE 0 END) >= 100
        AND SUM(CASE WHEN MONTH(o.order_date) = 7 THEN o.quantity * p.price ELSE 0 END) >= 100
)

SELECT c.customer_id, c.name
FROM Spending_Customers s
JOIN Customers c
ON s.customer_id = c.customer_id;
