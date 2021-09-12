/*
  Give the five most popular stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
WITH start_station_amount AS(SELECT start_station
	FROM indego_trips_2019_q2
	WHERE EXTRACT(HOUR FROM START_TIME) = 7 AND EXTRACT(HOUR FROM END_TIME) = 9)
    ,end_station_amount AS(
	SELECT end_station
   FROM indego_trips_2019_q2
	WHERE EXTRACT(HOUR FROM START_TIME) = 7 AND EXTRACT(HOUR FROM END_TIME) = 9)
, unioned_table as(
SELECT start_station
FROM start_station_amount
UNION ALL 
SELECT end_station
FROM end_station_amount)

SELECT start_station,COUNT(*) AS frequency
FROM unioned_table
GROUP BY start_station
ORDER BY 2 DESC
LIMIT 5

--result:3021,3102,3156,3052,3045

