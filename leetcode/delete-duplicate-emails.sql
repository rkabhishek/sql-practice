-- leetcode 196

-- solution 1 using JOIN
WITH Smallest_Id AS (
    SELECT MIN(id) AS id
    FROM Person
    GROUP BY email
)

DELETE p
FROM Person p
LEFT JOIN Smallest_Id s
ON p.id = s.id
WHERE s.id IS NULL;

-- solution 2 using subquery
WITH Min_Id AS (
    SELECT MIN(id) AS id
    FROM Person
    GROUP BY email
)

DELETE FROM Person
WHERE id NOT IN (SELECT id FROM Min_Id)
