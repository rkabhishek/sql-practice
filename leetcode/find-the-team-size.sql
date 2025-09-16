-- leetcode 1303

-- solution 1 using CTE and JOIN
WITH Team_Size AS (
    SELECT team_id, COUNT(*) AS team_size
    FROM Employee
    GROUP BY team_id
)

SELECT e.employee_id, t.team_size
FROM Employee e
JOIN Team_Size t
ON e.team_id = t.team_id;

-- solution 2 using window function
SELECT employee_id,
       COUNT(*) OVER (PARTITION BY team_id) AS team_size
FROM Employee;
