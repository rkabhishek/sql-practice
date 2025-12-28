WITH User_1_Friends AS (
    SELECT user2_id AS friend
    FROM Friendship
    WHERE user1_id = 1
    UNION
    SELECT user1_id AS friend
    FROM Friendship
    WHERE user2_id = 1
),

User_1_Liked_Pages AS (
    SELECT page_id
    FROM Likes
    WHERE user_id = 1
)

SELECT DISTINCT page_id AS recommended_page
FROM User_1_Friends f
JOIN Likes l
ON f.friend = l.user_id
WHERE l.page_id NOT IN (SELECT page_id FROM User_1_Liked_Pages);
