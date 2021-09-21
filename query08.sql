/*
  Give the five most popular starting stations between 7am and 10am in 2019.
  ANSWER:
  The start_station of the five most popular starting stations between 7am and 10am in 2019 are: 
  3102,3012,3007,3064,3100
*/

-- Enter your SQL query here
SELECT start_station, COUNT(*) AS frequency FROM indego_trips_2019_q2 
WHERE
	EXTRACT(HOUR FROM start_time) >= 7 AND EXTRACT(HOUR FROM end_time) <= 9
GROUP BY start_station 
ORDER BY frequency DESC
LIMIT 5

