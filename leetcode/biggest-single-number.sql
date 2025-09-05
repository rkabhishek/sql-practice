-- leetcode 619

-- solution 1 using CTE
WITH SingleNumber AS (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
)

SELECT MAX(num) AS num
FROM SingleNumber;


-- solution 2 using inline subquery
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS SingleNumber;
