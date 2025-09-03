-- leetcode 570

-- solution 1 using CTE
WITH Popular_Manager
AS (SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5)

SELECT e.name
FROM Employee e JOIN Popular_Manager pm
ON e.id = pm.managerId;

-- solution 2 using subquery
SELECT name
FROM Employee
WHERE id IN
    (SELECT managerId
        FROM Employee
        GROUP BY managerId
        HAVING COUNT(*) >= 5);

