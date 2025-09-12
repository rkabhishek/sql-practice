-- leetcode 1587

-- solution 1 using subquery and then JOIN
SELECT u.name, t.balance
FROM Users u
JOIN
    (
        SELECT account, SUM(amount) AS balance
        FROM Transactions
        GROUP BY account
        HAVING SUM(amount) > 10000
    ) t
ON u.account = t.account;

-- solution 2 using JOIN directly
SELECT u.name, SUM(t.amount) AS balance
FROM Users u
JOIN Transactions t
ON u.account = t.account
GROUP BY u.account
HAVING SUM(t.amount) > 10000;
