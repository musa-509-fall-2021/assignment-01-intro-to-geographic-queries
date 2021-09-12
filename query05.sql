/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
SELECT trip_id,duration
FROM indego_trips_2020_q2
WHERE indego_trips_2020_q2.duration IN
( SELECT max(duration)
 FROM indego_trips_2020_q2)
 
 
--result:1440
