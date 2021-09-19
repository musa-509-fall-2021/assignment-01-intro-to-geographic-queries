/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
select sum(sum1) from(
select count(*)as sum1
from indego_trips_2020_q2
where(duration)<10
union
select count(*)as sum1
from indego_trips_2019_q2
where(duration)<10
)as total


select sum(sum1) from(
select count(*)as sum1
from indego_trips_2020_q2
where duration <10
union all
select count(*)as sum1
from indego_trips_2019_q2
where duration <10
)as total
