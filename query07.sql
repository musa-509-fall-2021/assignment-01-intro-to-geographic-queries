/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
SELECT COUNT(extract(day from end_time::timestamp - start_time::timestamp))
FROM indego_trips_2019_q2
WHERE extract(day from end_time::timestamp - start_time::timestamp)=1

-- Returned with 118
