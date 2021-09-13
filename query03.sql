/*
  What is the average duration of a trip for 2019?
*/

-- Enter your SQL query here

WITH 
    full_time as (
        SELECT EXTRACT(EPOCH FROM (TO_TIMESTAMP(end_time, 'MM/DD/YYYY HH24:MI') - TO_TIMESTAMP(start_time, 'MM/DD/YYYY HH24:MI'))) AS time_difference
      	FROM public.indego_trips_2020_q2
    )
SELECT *
FROM full_time
