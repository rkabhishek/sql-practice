-- leetcode 180

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT id,
           num,
           LEAD(num, 1) OVER (ORDER BY id) AS next1,
           LEAD(num, 2) OVER (ORDER BY id) AS next2
    FROM Logs
) t
WHERE num = next1 and num = next2;
