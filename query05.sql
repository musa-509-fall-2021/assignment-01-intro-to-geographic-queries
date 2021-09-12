/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
SELECT trip_id,duration
FROM indego_trips_2020_q2
WHERE indego_trips_2020_q2.duration IN
( SELECT max(duration)
 FROM indego_trips_2020_q2)
 
 
--result:1440

/*
Why are there so many trips of this duration?

Answer: According to Indego official website, the maximum rental time permitted is 24 hours. So those bikes that did not been returned within 24 hours were automatically returned.

*/
