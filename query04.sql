/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here

WITH 
    full_time as (
        SELECT 
      CAST(EXTRACT(EPOCH FROM end_time - start_time) AS int) AS seconds_difference
      	FROM public.indego_trips_2020_q2
    )
SELECT 
	CAST(AVG(seconds_difference)/60 AS decimal) as avg_minutes_per_trip
FROM full_time
WHERE seconds_difference IS NOT NULL

-- Average Duration of 49.781 Minutes per trip in 2020 Q2