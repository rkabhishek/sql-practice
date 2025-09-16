-- leetcode 1350

-- solution 1 using subquery and NOT IN
SELECT id, name
FROM Students
WHERE department_id NOT IN (SELECT id FROM Departments);

-- solution 2 using LEFT JOIN
SELECT s.id, s.name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.id
WHERE d.id IS NULL;
