-- leetcode 1280

WITH Students_And_Subjects
AS (SELECT student_id, student_name, subject_name
    FROM Students CROSS JOIN Subjects)

SELECT s.student_id, s.student_name, s.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students_And_Subjects s LEFT JOIN Examinations e
ON s.student_id = e.student_id AND s.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, s.subject_name
ORDER BY s.student_id, s.subject_name;
