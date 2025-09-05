-- leetcode 1070

WITH First_Year_Of_Sales AS (
    SELECT product_id, MIN(YEAR) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT f.product_id, f.first_year, s.quantity, s.price
FROM First_Year_Of_Sales f JOIN Sales s
ON f.product_id = s.product_id AND f.first_year = s.year;
