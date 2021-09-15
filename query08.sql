/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
SELECT 
	start_station,
  COUNT(*) AS number_of_trips
FROM public.indego_trips_2019_q2
WHERE EXTRACT(HOUR FROM start_time) > 7 and EXTRACT(HOUR FROM start_time) < 10
GROUP BY start_station
ORDER BY number_of_trips DESC
LIMIT 5
