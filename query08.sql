/*
  Give the five most popular stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
SELECT s.name AS station_name, COUNT(t.start_station) AS frequency FROM indego_trips_2019_q2 AS t
INNER JOIN station_status AS s ON t.start_station = s.id
WHERE date_part('h', t.start_time) >= 7 AND date_part('h', t.start_time) < 10
GROUP BY s.name
ORDER BY frequency DESC
LIMIT 5