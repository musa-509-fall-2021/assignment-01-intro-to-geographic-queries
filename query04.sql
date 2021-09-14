/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here

WITH 
    full_time as (
        SELECT 
      CAST(EXTRACT(EPOCH FROM (TO_TIMESTAMP(end_time, 'MM/DD/YYYY HH24:MI') - TO_TIMESTAMP(start_time, 'MM/DD/YYYY HH24:MI'))) AS int) AS time_difference
      	FROM public.indego_trips_2020_q2
    )
SELECT 
	AVG(time_difference)/60 as avg_minutes_per_trip
FROM full_time
WHERE time_difference IS NOT NULL

-- Average Duration of 49.781 Minutes per trip in 2020 Q2
