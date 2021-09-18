/*
  Give the five most popular starting stations between 7am and 10am in 2019.
  ANSWER:
  The cartodb_id of the five most popular starting stations between 7am and 10am in 2019 are: 
  201691, 201544, 199210,203830 and 96245
*/

-- Enter your SQL query here
SELECT cartodb_id
FROM indego_trips_2019_q2
WHERE
	EXTRACT(HOUR FROM start_time) >= 7 AND EXTRACT(HOUR FROM end_time) <= 10
ORDER BY start_station DESC
LIMIT 5
