-- leetcode 534

SELECT a1.player_id, a1.event_date, SUM(a2.games_played) AS games_played_so_far
FROM Activity a1
JOIN (
    SELECT player_id, event_date, games_played
    FROM Activity
) a2
ON a1.player_id = a2.player_id AND a1.event_date >= a2.event_date
GROUP BY a1.player_id, a1.event_date;
