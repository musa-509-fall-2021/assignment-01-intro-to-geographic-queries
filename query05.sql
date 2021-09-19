/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
select max (a)
from
(select max(duration) as a from indego_trips_2020_q2
 union
 select max(duration)as a from indego_trips_2019_q2)as d
