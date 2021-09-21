/*
  What is the average duration of a trip for 2019?
*/

-- Enter your SQL query here
SELECT round(avg(duration),2) AS duration_mean
FROM indego_trips_2019_q2
 
 
--result:23.67
