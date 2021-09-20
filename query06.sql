/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here

with sum_trips as(
select cartodb_id, duration 
from indego_trips_2020_q2
union 
select cartodb_id, duration 
from indego_trips_2019_q2)

select count(*) from sum_trips
where  duration < 10


/*
The query result: 119596
*/