/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here

WITH counts2019 AS (
  SELECT start_station, COUNT(*) as ntrips
  FROM indego_trips_2019_q2
  GROUP BY start_station
)

SELECT b.id, b.name, a.ntrips
FROM counts2019 a
INNER JOIN station_status b
ON a.start_station = b.id
ORDER BY ntrips DESC
LIMIT 5
;