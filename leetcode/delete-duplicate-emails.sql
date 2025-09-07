-- leetcode 196

WITH Smallest_Id AS (
    SELECT MIN(id) AS id
    FROM Person
    GROUP BY email
)


DELETE
FROM Person
WHERE id NOT IN (SELECT id FROM Smallest_Id);
