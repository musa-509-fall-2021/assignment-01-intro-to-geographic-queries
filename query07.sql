/*
  How many trips started on one day and ended in the next?
*/

SELECT 
    COUNT(*)
FROM public.indego_trips_2020_q2
WHERE EXTRACT(DAY FROM (end_time)) <> EXTRACT(DAY FROM (start_time))

-- Answer: 3,000 trips started and ended in different days