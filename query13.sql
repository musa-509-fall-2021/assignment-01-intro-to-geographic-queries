/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT id,name,st_distance(the_geom, 'POINT(-75.19268489458014 39.95241719826734)'::geography)
FROM indego_station_statuses
WHERE st_distance(the_geom, 'POINT(-75.19268489458014 39.95241719826734)'::geography) IN 
(SELECT MAX(st_distance(the_geom, 'POINT(-75.19268489458014 39.95241719826734)'::geography))
 FROM indego_station_statuses)
 
