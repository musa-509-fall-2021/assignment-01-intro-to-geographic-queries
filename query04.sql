/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here

SELECT  round(AVG(duration),3) AS avg_duration_2020
FROM indego_trips_2020_q2;