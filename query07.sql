/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
with union_table as (
  SELECT a.trip_id,a.duration,a.start_time::date,a.end_time::date,2019 as year
  FROM indego_trips_2019_q2 a
  UNION
  SELECT b.trip_id,b.duration,b.start_time::date,b.end_time::date,2020 as year
  FROM indego_trips_2020_q2 b)
 
SELECT count(*),year
FROM union_table
WHERE EXTRACT(DAY FROM end_time::date)-EXTRACT(DAY FROM start_time::date) = 1
GROUP BY 2


