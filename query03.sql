/*
  What is the average duration of a trip for 2019?
*/

-- Enter your SQL query here

WITH 
    full_time as (
        SELECT 
        CAST(EXTRACT(EPOCH FROM (end_time - start_time)) AS int) AS time_difference
      	FROM indego_trips_2019_q2
    )
SELECT 
	AVG(time_difference)/60 as avg_minutes_per_trip
FROM full_time
WHERE time_difference IS NOT NULL

-- Average Duration of 24.696 Minutes per trip in 2019 Q2
