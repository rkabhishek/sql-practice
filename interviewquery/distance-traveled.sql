WITH user_distance AS (
    SELECT passenger_user_id, SUM(distance) AS total_distance
    FROM rides
    GROUP BY passenger_user_id
)

SELECT name, COALESCE(total_distance, 0) AS distance_traveled
FROM users u
LEFT JOIN user_distance t
ON u.id = t.passenger_user_id
ORDER BY distance_traveled DESC;
