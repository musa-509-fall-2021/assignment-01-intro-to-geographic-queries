/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
select max
from
(select max(duration)from indego_trips_2020_q2
 union
 select max(duration)from indego_trips_2020_q2)d
