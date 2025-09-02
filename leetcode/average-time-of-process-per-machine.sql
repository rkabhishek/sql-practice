-- leetcode 1661

WITH Per_Process_Time
AS
    (SELECT machine_id, process_id,
        SUM(CASE WHEN activity_type = 'start' THEN -timestamp
                 WHEN activity_type = 'end' THEN timestamp
            END) AS ts
    FROM Activity
    GROUP BY 1,2)

SELECT machine_id, ROUND(AVG(ts), 3) AS processing_time
FROM Per_Process_Time
GROUP BY machine_id;
