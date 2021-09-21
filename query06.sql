/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
SELECT (SELECT COUNT (*) FROM indego_trips_2020_q2 WHERE duration <10) + (SELECT COUNT (*) FROM indego_trips_2019_q2 WHERE duration <10) 