/*
  How many trips were shorter than 10 minutes?
  ANSWER: 74958 for year 2019 and 46729 for year 2020.
*/

-- Enter your SQL query here
SELECT COUNT(duration) FROM indego_trips_2019_q2 WHERE duration < 10
SELECT COUNT(duration) FROM indego_trips_2020_q2 WHERE duration < 10
