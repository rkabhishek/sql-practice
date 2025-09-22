-- leetcode 1907

WITH Categories AS (
    SELECT 'High Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'Low Salary'
    ),
    Categorization AS (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
    )


SELECT a.category, COUNT(b.category) AS accounts_count
FROM Categories a
LEFT JOIN Categorization b ON a.category = b.category
GROUP BY a.category;
