/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
select count(*)
from indego_trips_2020_q2
where extract(day from end_time :: date) - extract (day from start_time :: date) = 1
result = 2557
