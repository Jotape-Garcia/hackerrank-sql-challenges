
/*
    Exercise Link: https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

    Ketty gives Eve a task to generate a report containing three columns: Name, Grade and 
    Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report 
    must be in descending order by grade -- i.e. higher grades are entered first. If there is more 
    than one student with the same grade (8-10) assigned to them, order those particular students by 
    their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list
    them by their grades in descending order. If there is more than one student with the same grade (1-7) 
    assigned to them, order those particular students by their marks in ascending order.

    Write a query to help Eve.
*/

SELECT IIF(g.grade >= 8, s.name, 'NULL') AS name,
    g.grade,
    s.marks
FROM Students AS s
INNER JOIN Grades as g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY g.grade DESC, s.name ASC, s.marks ASC;
