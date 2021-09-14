/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
SELECT count(*)
from indego_trips_2019_q2
where duration < 10
