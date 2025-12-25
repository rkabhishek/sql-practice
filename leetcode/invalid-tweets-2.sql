WITH stats AS (
    SELECT
        tweet_id,
        CHAR_LENGTH(content) AS len,
        CHAR_LENGTH(content) - CHAR_LENGTH(REPLACE(content, '@', '')) AS mentions,
        CHAR_LENGTH(content) - CHAR_LENGTH(REPLACE(content, '#', '')) AS hashtags
    FROM Tweets
)

SELECT tweet_id
FROM stats
WHERE len > 140 OR mentions > 3 or hashtags > 3
ORDER BY tweet_id;
