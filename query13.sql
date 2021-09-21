/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT id,
     name,
     st_distance(st_transform(st_setsrid(the_geom,4326),3857),st_transform(st_setsrid(st_makepoint(-75.19273854113067,39.95235140309713),4326),3857)) as distance
FROM indego_station_statuses
WHERE  st_distance(st_transform(st_setsrid(the_geom,4326),3857),st_transform(st_setsrid(st_makepoint(-75.19273854113067,39.95235140309713),4326),3857)) IN 
(SELECT MAX(st_distance(st_transform(st_setsrid(the_geom,4326),3857),st_transform(st_setsrid(st_makepoint(-75.19273854113067,39.95235140309713),4326),3857)))
 FROM indego_station_statuses)

