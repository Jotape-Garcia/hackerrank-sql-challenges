
/*
    Exercise Link: https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true
    
    Consider P1(a, c) and P2(b, d) to be two points on a 2D plane where (a, b) are the respective minimum and maximum 
    values of Northern Latitude (LAT_N) and (c, d) are the respective minimum and maximum values of Western Longitude 
    (LONG_W) in STATION.

    Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.
*/

SELECT FORMAT(SQRT(POWER(a - b, 2) + POWER(c - d, 2)), 'N4') AS euclidean_distance
FROM (
    SELECT MIN(LAT_N) AS a,
        MAX(LAT_N) AS b,
        MIN(LONG_W) AS c,
        MAX(LONG_W) AS d
    FROM STATION
) AS c
