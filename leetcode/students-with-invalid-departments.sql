-- leetcode 1350

-- solution 1 using subquery and NOT IN: Exclude students whose department_id is in Departments (fails if NULLs exist)
SELECT id, name
FROM Students
WHERE department_id NOT IN (SELECT id FROM Departments);

-- solution 2 using LEFT JOIN: Select students with no matching department (NULL-safe)
SELECT s.id, s.name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.id
WHERE d.id IS NULL;

-- solution 3 using NOT EXISTS: Return students where no department row exists with the same id (clear & safe)
SELECT s.id, s.name
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM Departments d
    WHERE d.id = s.department_id
);
