-- leetcode 1204

WITH Queue_With_Cumulative_Weight AS(
    SELECT turn, person_id, person_name, weight,
        SUM(weight) OVER (ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_weight
    FROM Queue
)

SELECT person_name
FROM Queue_With_Cumulative_Weight
WHERE cumulative_weight = (SELECT MAX(cumulative_weight) FROM Queue_With_Cumulative_Weight WHERE cumulative_weight <= 1000);
