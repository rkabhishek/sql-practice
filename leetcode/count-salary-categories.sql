-- leetcode 1907

-- solution 1 using CTE
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

-- solution 2 using SUM and CASE
SELECT 'Low Salary' AS category,
    SUM(CASE WHEN INCOME < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts

UNION ALL

SELECT 'Average Salary' AS category,
    SUM(CASE WHEN INCOME BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts

UNION ALL

SELECT 'High Salary' AS category,
    SUM(CASE WHEN INCOME > 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts;
