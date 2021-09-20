/*
  What is the average duration of a trip for 2020?
  39.24min
*/

-- Enter your SQL query here
select round(cast(avg(duration)as numeric), 2)::text||'min'
from indego_trips_2020_q2
