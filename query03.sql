/*
  What is the average duration of a trip for 2019?
*/

-- Enter your SQL query here
select round(avg(duration), 2) as avg_duration from public.indego_trips_2019_q2
