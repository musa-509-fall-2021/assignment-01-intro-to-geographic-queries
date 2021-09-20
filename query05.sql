/*
  What is the longest duration trip?
  1440min
*/

-- Enter your SQL query here
select max(a)::text||'min' as longest_trip
from(
  select max(duration) as a from indego_trips_2020_q2
  union
  select max(duration) as a from indego_trips_2019_q2
) as Q_05
