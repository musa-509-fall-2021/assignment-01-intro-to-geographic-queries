/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
WITH all_distance AS(
SELECT id,
     name, 
     st_transform(st_setsrid(the_geom, 4326), 3857) as the_geom_webmercator,
     st_distance(st_transform(st_setsrid(the_geom,4326),3857),st_transform(st_setsrid(st_makepoint(-75.19273854113067,39.95235140309713),4326),3857)) as distance
FROM indego_station_statuses)

SELECT (AVG(distance))::text||'m'
FROM all_distance

