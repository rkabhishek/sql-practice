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
    WHERE o.customerId = c.id
);

-- solution 3 using LEFT JOIN
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.id IS NULL;
