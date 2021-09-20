/*
  What is the longest duration trip?
*/

WITH 
  full_time as (
    SELECT 
    EXTRACT(EPOCH FROM end_time - start_time)::int AS seconds_difference
    FROM public.indego_trips_2020_q2
  )
SELECT 
    MAX(seconds_difference)/86400::FLOAT || ' Days' as longest_trip
FROM full_time
WHERE seconds_difference IS NOT NULL

-- longest trip was 29.8 Days
