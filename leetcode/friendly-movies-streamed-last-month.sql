-- leetcode 1495

SELECT DISTINCT title
FROM TVProgram t
JOIN Content c
ON t.content_id = c.content_id
WHERE MONTH(t.program_date) = 6 AND YEAR(t.program_date) = 2020
    AND Kids_content = 'Y' AND content_type = 'Movies';
