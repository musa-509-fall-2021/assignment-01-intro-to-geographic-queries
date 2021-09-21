/*
  Give the five most popular stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
WITH start_station_amount AS(SELECT start_station
	FROM indego_trips_2019_q2
	WHERE EXTRACT(HOUR FROM START_TIME) = 7 AND EXTRACT(HOUR FROM END_TIME) = 9)
    ,end_station_amount AS(
	SELECT end_station
   FROM indego_trips_2019_q2
	WHERE EXTRACT(HOUR FROM START_TIME) = 7 AND EXTRACT(HOUR FROM END_TIME) = 9)
, unioned_table as(
SELECT start_station as station_id
FROM start_station_amount
UNION ALL 
SELECT end_station
FROM end_station_amount)
, left_join_table AS(
  SELECT *
  FROM unioned_table
  LEFT JOIN indego_station_statuses
      on unioned_table.station_id 
      = indego_station_statuses.id)
      
SELECT count(*) AS frequency, name,station_id
FROM left_join_table
GROUP BY 2,3
ORDER BY frequency DESC
LIMIT 5


