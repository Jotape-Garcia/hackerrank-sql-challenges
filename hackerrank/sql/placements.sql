
/*
    Exercise Link: https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

    You are given three tables: Students, Friends and Packages. Students contains two columns: ID and 
    Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains 
    two columns: ID and Salary (offered salary in $ thousands per month).

    Write a query to output the names of those students whose best friends got offered a higher salary 
    than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed 
    that no two students got same salary offer.
*/

WITH students_salary AS (
    SELECT s.id AS student_id,
        s.name AS student_name,
        p.salary AS student_salary
    FROM Students AS s
    INNER JOIN Packages AS p ON s.id = p.id
),

friends_salary AS (
    SELECT f.id AS student_id,
        f.friend_id AS friend_id,
        p.salary AS friend_salary
    FROM Friends AS f
    INNER JOIN Packages AS p ON f.friend_id = p.id
)

SELECT s.student_name
FROM students_salary AS s
INNER JOIN friends_salary AS f ON s.student_id = f.student_id 
WHERE s.student_salary < f.friend_salary
ORDER BY f.friend_salary ASC;
