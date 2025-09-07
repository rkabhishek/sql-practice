-- leetcode 196

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
