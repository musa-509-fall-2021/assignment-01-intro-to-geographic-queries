/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
select count(*) as overnight_2019,
(
  select count(*) as overnight_2020
  from indego_trips_2020_q2
  where extract(doy from to_timestamp(end_time, 'MM/DD/YYYY HH24:MI')) - extract(doy from to_timestamp(start_time, 'MM/DD/YYYY HH24:MI')) = 1
)
from indego_trips_2019_q2
where extract(doy from end_time) - extract(doy from start_time) = 1