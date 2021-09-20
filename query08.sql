/*
  Give the five most popular starting stations between 7am and 10am in 2019.

  start_station: 3102,3012,3007,3064,3100


*/

-- Enter your SQL query here

select start_station,count(*)
from indego_trips_2019_q2
where extract(hour from start_time) between 7 and 10
group by start_station
order by count(*) desc
limit 5
