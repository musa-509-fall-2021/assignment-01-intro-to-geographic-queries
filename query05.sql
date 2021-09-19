/*
  What is the longest duration trip?
  ANSWER: For 2020 the longest duration trip is 1440, while for 2019 it is 1440.
*/

-- Enter your SQL query here
SELECT MAX(duration) FROM indego_trips_2020_q2
SELECT MAX(duration) FROM indego_trips_2019_q2
