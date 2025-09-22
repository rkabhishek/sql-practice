-- leetcode 1204

WITH Queue_With_Cumulative_Weight AS(
    SELECT person_name,
        SUM(weight) OVER (ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_weight
    FROM Queue
)

SELECT person_name
FROM (
    SELECT person_name,
        ROW_NUMBER() OVER (ORDER BY cumulative_weight DESC) AS row_num
    FROM Queue_With_Cumulative_Weight
    WHERE cumulative_weight <= 1000
) t
WHERE t.row_num = 1;
