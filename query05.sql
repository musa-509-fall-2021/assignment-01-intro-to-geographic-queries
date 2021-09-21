/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
with union_table as (
  SELECT a.trip_id,a.duration,2019 as year
  FROM indego_trips_2019_q2 a
  UNION
  SELECT b.trip_id,b.duration,2020 as year
  FROM indego_trips_2020_q2 b)
 
SELECT year,max(duration)
FROM union_table
GROUP BY 1
 

/*
Why are there so many trips of this duration?

Answer: According to Indego official website, the maximum rental time permitted is 24 hours. So those bikes that did not been returned within 24 hours were automatically returned.

*/
