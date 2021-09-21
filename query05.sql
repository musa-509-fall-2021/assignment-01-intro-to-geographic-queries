/*
  What is the longest duration trip?
*/#1440

-- Enter your SQL query here
SELECT MAX(duration) 
FROM indego_trips_2020_q2 UNION SELECT MAX(duration) 
FROM indego_trips_2019_q2

 
