-- leetcode 1445

-- solution 1 using SUM and CASE
SELECT sale_date, SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE -sold_num END) AS diff
FROM Sales
GROUP BY sale_date;

-- solution 2 using self-join
SELECT a.sale_date, a.sold_num - b.sold_num AS diff
FROM sales a JOIN sales b
ON a.sale_date = b.sale_date AND a.fruit = 'apples' AND b.fruit = 'oranges';
