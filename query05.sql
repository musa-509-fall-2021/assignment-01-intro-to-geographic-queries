/*
  What is the longest duration trip?
*/

-- Max duration for 2019:
SELECT MAX(duration)
FROM indego_trips_2019_q2

-- Max duration for 2020:
SELECT MAX(duration)
FROM indego_trips_2020_q2

-- Number of trips with max duration for 2019:
SELECT COUNT(trip_id)
FROM indego_trips_2019_q2
WHERE duration = 1440

-- Number of trips with max duration for 2020:
SELECT COUNT(trip_id)
FROM indego_trips_2020_q2
WHERE duration = 1440
