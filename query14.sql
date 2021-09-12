/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT id,name,st_distance(ST_Transform(the_geom,4326)::geography, 
                                  ST_Transform('SRID=4326;POINT(-75.19268489458014 39.95241719826734)'::geometry,4326)::geography)
FROM indego_station_statuses
WHERE st_distance(ST_Transform(the_geom,4326)::geography, 
                  ST_Transform('SRID=4326;POINT(-75.19268489458014 39.95241719826734)'::geometry,4326)::geography) IN 
(SELECT MIN(st_distance(ST_Transform(the_geom,4326)::geography, 
                                  ST_Transform('SRID=4326;POINT(-75.19268489458014 39.95241719826734)'::geometry,4326)::geography))
 FROM indego_station_statuses)
