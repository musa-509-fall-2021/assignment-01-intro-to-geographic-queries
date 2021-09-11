/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here
SELECT round(avg(duration),2) AS duration_mean
FROM indego_trips_2020_q2

--result:39.24
