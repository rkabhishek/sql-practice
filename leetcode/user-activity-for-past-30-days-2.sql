-- leetcode 1142

SELECT COALESCE(
           ROUND(
               1.0 * COUNT(DISTINCT session_id)
               / NULLIF(COUNT(DISTINCT user_id), 0),
           2),
       0) AS average_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27';
