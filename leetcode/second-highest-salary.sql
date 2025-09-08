-- leetcode 176

WITH Distinct_Salaries AS (
    SELECT DISTINCT salary
    FROM Employee
)

SELECT MAX(salary) AS SecondHighestSalary
FROM Distinct_Salaries
WHERE salary <> (SELECT MAX(salary) FROM Employee);
