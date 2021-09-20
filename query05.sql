/*
  What is the longest duration trip?
*/

-- For 2019:
SELECT COUNT(trip_id)
FROM indego_trips_2019_q2
WHERE duration = 1440

-- For 2020:
SELECT COUNT(trip_id)
FROM indego_trips_2020_q2
WHERE duration = 1440
