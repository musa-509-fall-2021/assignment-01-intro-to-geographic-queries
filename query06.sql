/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
select count(*) as trips_lessthan10_2020, 
(
  select count(*) as trips_lessthan10_2019
  from indego_trips_2020_q2
  where duration < 10
) 
from indego_trips_2019_q2
where duration < 10

