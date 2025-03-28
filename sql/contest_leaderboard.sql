
/*
    Exercise Link: https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

    You did such a great job helping Julia with her last coding contest challenge that she wants you to work on 
    this one, too!

    The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to 
    print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one 
    hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a 
    total score of  from your result.
*/

WITH CTE AS (
    SELECT hacker_id,
        challenge_id,
        MAX(score) AS score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
)

SELECT h.hacker_id,
    h.name,
    SUM(c.score) AS total_score
FROM Hackers AS h
INNER JOIN CTE AS c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(c.score) > 0
ORDER BY SUM(c.score) DESC, h.hacker_id ASC;
