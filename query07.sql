/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
SELECT COUNT(*) FROM 
  (SELECT trip_id, duration,DATE_PART('day',start_time::date) AS start_day, DATE_PART('day',end_time::date) AS end_day
  FROM indego_trips_2019_q2
  UNION ALL
  SELECT trip_id, duration, DATE_PART('day',start_time::date) AS start_day, DATE_PART('day',end_time::date) AS end_day 
  FROM indego_trips_2020_q2) AS u
WHERE start_day != end_day