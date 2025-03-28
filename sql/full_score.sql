
/*
    Exercise Link: https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true

    Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
    Write a query to print the respective hacker_id and name of hackers who achieved full scores for more 
    than one challenge. Order your output in descending order by the total number of challenges in which 
    the hacker earned a full score. If more than one hacker received full scores in same number of 
    challenges, then sort them by ascending hacker_id.
*/

WITH CTE AS (
    SELECT s.hacker_id,
        COUNT(s.score) AS total_challenges
    FROM Submissions AS s
    INNER JOIN Challenges as c ON s.challenge_id = c.challenge_id
    INNER JOIN Difficulty as d ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
    GROUP BY s.hacker_id
)

SELECT h.hacker_id, 
    h.name
FROM Hackers AS h
INNER JOIN CTE AS c ON h.hacker_id = c.hacker_id
WHERE c.total_challenges > 1
ORDER BY c.total_challenges DESC, h.hacker_id ASC;

