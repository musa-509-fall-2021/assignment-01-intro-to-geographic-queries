/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
WITH all_distance AS(
  SELECT indego_station_statuses.id,indego_station_statuses.name,st_distance(the_geom, 'POINT(-75.19268489458014 39.95241719826734)'::geography) AS distance
FROM indego_station_statuses)

SELECT (AVG(distance))::text||'m'
FROM all_distance

--result:2867.35609445575m

