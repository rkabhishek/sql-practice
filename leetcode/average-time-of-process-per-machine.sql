-- leetcode 1661

-- solution 1 using CTE
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

-- solution 2 using join
SELECT a1.machine_id, ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity a1 join Activity a2
ON a1.machine_id = a2.machine_id AND a1.process_id = a2.process_id AND (a1.activity_type = 'start' AND a2.activity_type = 'end')
GROUP BY a1.machine_id;
