
/*
    Exercise Link: https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
    
    Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.

    - happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
    - happens to equal the minimum value in Western Longitude (LONG_W in STATION).
    - happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
    - happens to equal the maximum value in Western Longitude (LONG_W in STATION).
    
    Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/

SELECT FORMAT(ROUND(ABS(a - c) + ABS(b - d), 4), 'N4') AS manhattan_distance
FROM (
    SELECT MIN(LAT_N) AS a,
        MIN(LONG_W) AS b,
        MAX(LAT_N) AS c,
        MAX(LONG_W) AS d
    FROM STATION
) AS c
