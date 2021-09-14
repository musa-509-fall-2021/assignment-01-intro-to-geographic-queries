/*
  What is the average duration of a trip for 2019?
*/

-- Enter your SQL query here

SELECT  round(AVG(duration),3) AS avg_duration_2019
FROM indego_trips_2019_q2;

