/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
SELECT COUNT(*) as overnight_2019,
(
  SELECT COUNT(*) as overnight_2020
  FROM indego_trips_2020_q2
  WHERE extract(doy FROM to_timestamp(end_time, 'MM/DD/YYYY HH24:MI')) - extract(doy from to_timestamp(start_time, 'MM/DD/YYYY HH24:MI')) = 1
)
FROM indego_trips_2019_q2
WHERE extract(doy FROM end_time) - extract(doy FROM start_time) = 1