-- leetcode 610

SELECT x, y, z,
    CASE
        WHEN x + y > Z AND y + z > x AND z + x > y THEN "Yes"
        ELSE "No"
    END AS triangle
FROM Triangle;
