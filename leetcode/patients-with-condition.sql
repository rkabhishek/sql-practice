-- leetcode 1527

-- solution 1 using concat
SELECT *
FROM Patients
WHERE CONCAT(' ', conditions) LIKE '% DIAB1%';

-- solution 2 using 2 conditions
SELECT *
FROM Patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%';
