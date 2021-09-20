/*
  How many trips were shorter than 10 minutes?
*/

WITH 
  full_time as (
    SELECT 
    EXTRACT(EPOCH FROM end_time - start_time)::int AS seconds_difference
    FROM public.indego_trips_2020_q2
  )
SELECT 
    COUNT(seconds_difference) as trips_below_10_mins
FROM full_time
WHERE seconds_difference < 60*10

-- Answer: For Q2 2020, 46,786 trips below 10 minutes