/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
SELECT count(*) AS num_trips_under_10min FROM 
  (SELECT trip_id, duration, start_time::date
  FROM indego_trips_2019_q2
  UNION ALL
  SELECT trip_id, duration, start_time::date
  FROM indego_trips_2020_q2) AS u
WHERE duration < 10