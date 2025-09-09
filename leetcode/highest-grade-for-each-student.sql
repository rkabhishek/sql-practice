-- leetcode 1112

-- solution 1 using JOIN
SELECT e.student_id, MIN(e.course_id) AS course_id, e.grade
FROM Enrollments e
JOIN (
    SELECT student_id, MAX(grade) AS max_grade
    FROM Enrollments
    GROUP BY student_id
) AS m
ON e.student_id = m.student_id
WHERE e.grade = m.max_grade
GROUP BY e.student_id
ORDER BY e.student_id;

-- solution 2 using IN
SELECT student_id, MIN(course_id) AS course_id, grade
FROM Enrollments
WHERE (student_id, grade) IN (
    SELECT student_id, MAX(grade)
    FROM Enrollments
    GROUP BY student_id
)
GROUP BY student_id
ORDER BY student_id;
