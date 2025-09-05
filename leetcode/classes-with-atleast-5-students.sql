-- leetcode 596

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;
