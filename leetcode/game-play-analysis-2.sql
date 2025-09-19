-- leetcode 512

-- solution 1 using CTE and JOIN
WITH First_Login AS (
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY player_id
)

SELECT a.player_id, a.device_id
FROM Activity a
JOIN First_login fl ON a.player_id = fl.player_id AND a.event_date = fl.event_date;

-- solution 2 using subquery and IN
SELECT player_id, device_id
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY player_id
);
