-- leetcode 1581

-- solution 1 using left join
SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits v LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id;

-- solution 2 using NOT IN
SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits
WHERE visit_id NOT IN (SELECT DISTINCT visit_id FROM Transactions)
GROUP BY customer_id;

-- solution 3 using NOT EXISTS
SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits v
WHERE NOT EXISTS (
    SELECT 1
    FROM Transactions t
    WHERE v.visit_id = t.visit_id
)
GROUP BY customer_id;
