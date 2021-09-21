/*
  How many trips started on one day and ended in the next?
  ANSWER: 
  1600 for year 2019
  2557 for year 2020
*/

-- Enter your SQL query here
SELECT trips_sum
FROM(
  SELECT 
	COUNT(*) AS trips_sum
FROM indego_trips_2019_q2
    WHERE 
    EXTRACT(DAY FROM end_time) - EXTRACT(DAY FROM start_time) = 1
  UNION
   SELECT 
	COUNT(*) AS trips_sum
  FROM indego_trips_2020_q2
    WHERE 
    EXTRACT(DAY FROM end_time::date) - EXTRACT(DAY FROM start_time::date) = 1
  ) AS Q7
