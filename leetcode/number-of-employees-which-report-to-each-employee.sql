-- leetcode 1731

WITH Managers AS (
    SELECT reports_to AS employee_id, COUNT(*) AS reports_count, ROUND(AVG(age)) AS average_age
    FROM Employees
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to
)

SELECT e.employee_id, e.name, m.reports_count, m.average_age
FROM Employees e JOIN Managers m
ON e.employee_id = m.employee_id
ORDER BY e.employee_id;
