/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
CREATE TABLE durations as
  SELECT trip_id, duration, 2019 as year
    FROM indego_trips_2019_q2
  UNION
  SELECT trip_id, duration, 2020 as year
    FROM indego_trips_2020_q2
;

SELECT * FROM durations
  WHERE year=2019
  ORDER BY duration DESC
  LIMIT 1
;

SELECT * FROM durations
  WHERE year=2020
  ORDER BY duration DESC
  LIMIT 1
;