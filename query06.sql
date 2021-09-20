/*
  How many trips were shorter than 10 minutes?
  121687
*/

-- Enter your SQL query here
select a.num_trips_2019+b.num_trips_2020 as Total_trips
from
     (select count(*) as num_trips_2019
      from indego_trips_2019_q2
      where duration <10) as a,
     (select count(*) as num_trips_2020
      from indego_trips_2020_q2
      where duration <10) as b
