-- leetcode 1934

-- solution 1 using CTE and then LEFT JOIN
WITH Confirmation_Rate
AS (
    SELECT user_id,
        ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END), 2) AS confirmation_rate
    FROM Confirmations
    GROUP BY user_id)

SELECT s.user_id, COALESCE(cr.confirmation_rate, 0) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmation_Rate cr
ON s.user_id = cr.user_id;

-- solution 2 using LEFT JOIN without CTE
SELECT s.user_id, ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END), 2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;
