/*
    Exercise Link: https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

    Julia asked her students to create some coding challenges. Write a query to print the hacker_id, 
    name, and the total number of challenges created by each student. Sort your results by the total 
    number of challenges in descending order. If more than one student created the same number of 
    challenges, then sort the result by hacker_id. If more than one student created the same number 
    of challenges and the count is less than the maximum number of challenges created, then exclude 
    those students from the result.
*/

WITH CTE AS (
    SELECT h.hacker_id,
        h.name,
        COUNT(challenge_id) AS total_challenges
    FROM Hackers as h
    INNER JOIN Challenges as c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
)

SELECT *
FROM CTE
WHERE 
    total_challenges = (SELECT MAX(total_challenges) AS total_challenges FROM CTE)
    OR total_challenges IN (
        SELECT total_challenges
        FROM (
            SELECT total_challenges,
            COUNT(hacker_id) AS distinct_id
            FROM CTE
            GROUP BY total_challenges
        ) AS filtered
        WHERE distinct_id = 1
    )
GROUP BY hacker_id, name, total_challenges
ORDER BY total_challenges DESC, hacker_id ASC;
