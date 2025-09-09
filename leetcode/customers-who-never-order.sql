-- leetcode 183

-- solution 1 using NOT IN
SELECT name AS Customers
FROM Customers WHERE id NOT IN (
    SELECT customerId FROM Orders
);

-- solution 2 using NOT EXISTS
SELECT name AS Customers
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_Id = c.id
);
