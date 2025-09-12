-- leetcode 1173

-- solution 1: using CASE works in every SQL engine
SELECT ROUND(COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM Delivery;

-- solution 2: may not work in every SQL engine because boolean isn't converted to 0 and 1
SELECT ROUND(SUM(order_date = customer_pref_delivery_date) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM Delivery;

-- solution 3: may not work in every SQL engine because boolean isn't converted to 0 and 1
SELECT ROUND(AVG(order_date = customer_pref_delivery_date) * 100.0, 2) AS immediate_percentage
FROM Delivery;
