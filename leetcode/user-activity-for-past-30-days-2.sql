-- leetcode 1142

-- Steps:
-- 1. Aggregate first (CTE) and divide safely using NULLIF
-- 2. Round the result to 2 decimal places
-- 3. Use COALESCE to result in 0 in case calculation returns NULL

WITH User_Session_Info AS (
    SELECT COUNT(DISTINCT session_id) AS sessions, NULLIF(COUNT(DISTINCT user_id), 0) AS users
    FROM Activity
    WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
)


SELECT COALESCE(ROUND(1.0 * sessions / users, 2), 0) AS average_sessions_per_user
FROM User_Session_Info;
