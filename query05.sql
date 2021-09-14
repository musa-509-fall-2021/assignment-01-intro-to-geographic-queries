/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
CREATE TABLE durations as
  SELECT trip_id, duration
    FROM indego_trips_2019_q2
  UNION
  SELECT trip_id, duration
    FROM indego_trips_2020_q2
;

SELECT * FROM durations
  ORDER BY duration DESC
  LIMIT 1
;
  