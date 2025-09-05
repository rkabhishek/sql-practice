-- leetcode 1174

WITH First_Order AS (
    SELECT customer_id, MIN(ORDER_date) AS order_date
    FROM Delivery
    GROUP BY customer_id
)

SELECT ROUND(COUNT(CASE WHEN d.customer_pref_delivery_date = d.order_date THEN 1 END) * 100 / COUNT(*), 2) AS immediate_percentage
FROM Delivery d JOIN First_Order f
ON d.customer_id = f.customer_id AND d.order_date = f.order_date;
