-- leetcode 1934

WITH Confirmation_Rate
AS (
    SELECT user_id,
        ROUND(COUNT(CASE WHEN action = 'confirmed' THEN 1 END) / COUNT(*), 2) AS confirmation_rate
    FROM Confirmations
    GROUP BY user_id)

SELECT s.user_id, COALESCE(cr.confirmation_rate, 0) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmation_Rate cr
ON s.user_id = cr.user_id;
