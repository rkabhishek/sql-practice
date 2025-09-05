-- leetcode 500

WITH First_Login_Date AS (
    SELECT player_id, MIN(event_date) AS min_event_date
    FROM Activity
    GROUP BY player_id
)

SELECT ROUND((SELECT COUNT(*)
FROM First_Login_Date f JOIN Activity a
ON f.player_id = a.player_id AND DATEDIFF(a.event_date, f.min_event_date) = 1) * 1.0  / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction;
