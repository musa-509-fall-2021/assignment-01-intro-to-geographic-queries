/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.

  15th & Kitty Hawk
  
*/


-- Enter your SQL query here
SELECT id, name, (max((ST_TRANSFORM(the_geom, 2272) <-> ST_TRANSFORM(ST_SETSRID(ST_MAKEPOINT(-75.1923, 39.9520), 4326),2272)::geometry))) as distance_to_meyerson
FROM indego_station_statuses
GROUP BY id, name
ORDER BY distance_to_meyerson desc
LIMIT 1