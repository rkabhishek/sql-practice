-- leetcode 534

-- solution 1 using self-join
SELECT a1.player_id, a1.event_date, SUM(a2.games_played) AS games_played_so_far
FROM Activity a1
JOIN (
    SELECT player_id, event_date, games_played
    FROM Activity
) a2
ON a1.player_id = a2.player_id AND a1.event_date >= a2.event_date
GROUP BY a1.player_id, a1.event_date;

-- solution 2 using SUM() OVER
SELECT
    player_id, event_date,
    SUM(games_played) OVER (
        PARTITION BY player_id
        ORDER BY event_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS games_played_so_far
FROM Activity;
