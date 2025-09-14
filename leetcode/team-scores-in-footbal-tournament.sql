-- leetcode 1212

WITH Host_Scores AS (
    SELECT
        host_team as team_id,
        SUM(CASE WHEN host_goals > guest_goals THEN 3
                WHEN host_goals = guest_goals THEN 1
                ELSE 0
            END) AS num_points
    FROM Matches
    GROUP BY host_team
),

Guest_Scores AS (
    SELECT
        guest_team AS team_id,
        SUM(CASE WHEN guest_goals > host_goals THEN 3
                WHEN guest_goals = host_goals THEN 1
                ELSE 0
            END) AS num_points
    FROM Matches
    GROUP BY guest_team
),

Total_Score AS (
    SELECT team_id, SUM(num_points) AS num_points
    FROM (
        SELECT *
        FROM Guest_Scores
        UNION ALL
        SELECT *
        FROM Host_Scores
    ) combined
    GROUP BY team_id
)

SELECT t.team_id, t.team_name, COALESCE(s.num_points, 0) AS num_points
FROM Teams t
LEFT JOIN Total_Score s
ON t.team_id = s.team_id
ORDER BY num_points DESC, team_id;
