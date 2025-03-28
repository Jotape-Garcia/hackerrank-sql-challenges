
/*
    Exercise Link: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true

    Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

    Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to 
    buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power 
    of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has 
    same power, sort the result in order of descending age.
*/

WITH CTE AS (
    SELECT w.id AS id,
        wp.age AS age,
        w.coins_needed AS coins_needed,
        w.power AS power
    FROM Wands as w
    INNER JOIN Wands_Property AS wp ON w.code = wp.code
    WHERE wp.is_evil = 0
)

SELECT c1.id, 
    c1.age, 
    c1.coins_needed,
    c1.power
FROM CTE AS c1
INNER JOIN (
    SELECT age,
        power,
        MIN(coins_needed) AS coins_needed
    FROM CTE
    GROUP BY age, power
) AS c2 ON c1.age = c2.age AND c1.power = c2.power AND c1.coins_needed = c2.coins_needed
ORDER BY c1.power DESC, c1.age DESC;
