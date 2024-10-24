-- leetcode 577

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN BONUS b
ON e.empID = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
