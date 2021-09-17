/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
with startStationTrips as (
  select start_station, count(*)
        filter (where (extract(hour from start_time) >= 7) and
                      (extract(hour from end_time) <= 10)
                )
  from indego_trips_2019_q2
  group by start_station
)




select *
from startStationTrips