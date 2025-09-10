-- leetcode 1407

SELECT u.name, COALESCE(SUM(distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r
ON u.id = r.user_id
GROUP BY u.id
ORDER BY travelled_distance desc, u.name;
