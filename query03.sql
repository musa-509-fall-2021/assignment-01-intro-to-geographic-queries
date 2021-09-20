/*
  What is the average duration of a trip for 2019?
  23.67 min
*/

-- Enter your SQL query here
select round(cast(avg(duration)as numeric), 2)::text||'min'
from indego_trips_2019_q2
