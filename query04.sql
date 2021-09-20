/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here
SELECT ROUND(AVG(duration), 2)
FROM public.indego_trips_2020_q2
