/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
SELECT MAX(DURATION)
 FROM indego_trips_2019_q2
 
-- and 
SELECT MAX(DURATION)
 FROM indego_trips_2020_q2

--both returned with 1440 mins = 24 hours
 /*
Why are there so many trips of this duration?

Answer: maybe those users didn't even return their bicycle and the max duration the system generate is 1440 (mins)
*/
