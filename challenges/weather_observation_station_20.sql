
/*
    Exercise Link: https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true

    A median is defined as a number separating the higher half of a data set from the lower half. Query the median 
    of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/

WITH CTE AS (
    SELECT LAT_N, 
           ROW_NUMBER() OVER(ORDER BY LAT_N) AS row_number, 
           COUNT(*) OVER() AS total_rows
    FROM STATION
)

SELECT FORMAT(ROUND(LAT_N, 4), 'N4')
FROM CTE
WHERE row_number = (total_rows + 1) / 2;
