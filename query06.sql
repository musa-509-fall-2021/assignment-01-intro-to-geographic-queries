/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here

with union_table as (
  SELECT a.trip_id,a.duration,2019 as year
  FROM indego_trips_2019_q2 a
  UNION
  SELECT b.trip_id,b.duration,2020 as year
  FROM indego_trips_2020_q2 b)
 
SELECT count(*),year
FROM union_table
WHERE duration < 10
GROUP BY 2

