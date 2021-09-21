/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT id, name, MAX(st_distance(the_geom::geography,st_setsrid(st_makepoint(-75.19265592098236,39.95222903068502)::geography,4326)))FROM indego_station_statuses
GROUP BY id, name
ORDER BY MAX(st_distance(the_geom::geography,st_setsrid(st_makepoint(-75.19265592098236,39.95222903068502)::geography,4326))) DESC
LIMIT 1