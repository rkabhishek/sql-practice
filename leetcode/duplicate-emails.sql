-- leetcode 182

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
