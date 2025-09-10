-- leetcode 607

-- solution using NOT IN
-- this works because 'sales_id' in Orders is expected to be NOT NULL
-- as every order must be handled by a salesperson, otherwise this solution might fail
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);

-- solution using NOT EXISTS which handles NULL safely
SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    WHERE o.sales_id = s.sales_id
    AND c.name = 'RED'
);
