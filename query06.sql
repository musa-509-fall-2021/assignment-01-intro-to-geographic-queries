/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
with indego_trips as (
  select duration from indego_trips_2019_q2
  union
  select duration from indego_trips_2020_q2
)
select count(duration < 10)
from indego_trips
