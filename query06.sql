/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
SELECT count(duration)
from indego_trips_2020_q2
where duration < 10
-- returned with 46729

SELECT count(duration)
from indego_trips_2019_q2
where duration < 10
-- returned with 74958
