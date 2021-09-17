/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
select count(*)
from indego_trips_2020_q2
where  duration < 10