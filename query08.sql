/*
  Give the five most popular stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
SELECT s.station_name, COUNT(t.start_station) as frequency FROM indego_trips_2019_q2 AS t
INNER JOIN indego_stations AS s ON t.start_station = s.station_id
WHERE DATE_PART('h',t.start_time) >= 7 and DATE_PART('h',t.start_time) < 10
GROUP BY s.station_name
ORDER BY frequency desc
LIMIT 5