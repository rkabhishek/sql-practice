-- leetcode 180

-- solution 1 using LEAD window function
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT id,
           num,
           LEAD(num, 1) OVER (ORDER BY id) AS next1,
           LEAD(num, 2) OVER (ORDER BY id) AS next2
    FROM Logs
) t
WHERE num = next1 and num = next2;

-- solution 2 using JOIN
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num
AND l2.num = l3.num;
