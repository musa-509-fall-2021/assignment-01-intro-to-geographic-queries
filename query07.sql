/*
  How many trips started on one day and ended in the next?
*/

SELECT 
  COUNT(*) as trips_ending_the_next_day
FROM public.indego_trips_2020_q2
WHERE EXTRACT(DOY FROM (start_time)) + 1 = EXTRACT(DOY FROM (end_time))

-- Answer: For Q2 2020, 2,648 trips started and ended on the next day