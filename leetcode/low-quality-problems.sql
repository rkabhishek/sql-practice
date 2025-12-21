-- leetcode 2026

SELECT problem_id
FROM Problems
WHERE likes * 1.0 / (likes + dislikes) < 0.6
ORDER BY problem_id;
