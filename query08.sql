/*
  Give the five most popular stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
WITH start_station_amount AS(SELECT start_station,COUNT(*) AS start_number 
	FROM indego_trips_2019_q2
	WHERE EXTRACT(HOUR FROM START_TIME) = 7 AND EXTRACT(HOUR FROM END_TIME) = 9
	GROUP BY start_station)
    ,end_station_amount AS(
	SELECT end_station,COUNT(*) AS end_number
   FROM indego_trips_2019_q2
	WHERE EXTRACT(HOUR FROM START_TIME) = 7 AND EXTRACT(HOUR FROM END_TIME) = 9
	GROUP BY end_station
   )
,joined_table AS(
SELECT *
FROM start_station_amount ssa
FULL JOIN end_station_amount esa
ON ssa.start_station = esa.end_station)

SELECT *
FROM joined_table
