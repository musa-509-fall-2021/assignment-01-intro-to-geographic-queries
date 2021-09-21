/*
  How many trips were shorter than 10 minutes?
  ANSWER: 46729 for year 2019 and 74958 for year 2020.
*/

-- Enter your SQL query here
SELECT trip_less_than_10min
FROM(
  SELECT COUNT(duration) AS trip_less_than_10min FROM indego_trips_2019_q2 WHERE duration < 10
  UNION
  SELECT COUNT(duration) AS trip_less_than_10min FROM indego_trips_2020_q2 WHERE duration < 10
  ) AS Q6
