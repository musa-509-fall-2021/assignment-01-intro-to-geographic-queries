/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
SELECT count(*) 
FROM indego_trips_2020_q2
WHERE EXTRACT(DAY FROM end_time::date)-EXTRACT(DAY FROM start_time::date) = 1

--result:2557
