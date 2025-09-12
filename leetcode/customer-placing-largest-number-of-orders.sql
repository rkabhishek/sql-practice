-- leetcode 586

-- solution 1 which works for 1 customer with max orders
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

-- solution 2 which works for any number of customers placing max orders
SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(order_number) >= ALL(
    SELECT COUNT(order_number)
    FROM Orders
    GROUP BY customer_number
);
