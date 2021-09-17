/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
SELECT max(duration) AS longest_trip FROM
  (SELECT trip_id, duration, start_time::date
  FROM indego_trips_2019_q2
  UNION ALL
  SELECT trip_id, duration, start_time::date
  FROM indego_trips_2020_q2) AS u