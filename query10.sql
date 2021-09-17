/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT id, name, st_distance(the_geom, st_setsrid(st_point(-75.1948736, 39.9522363), 4326)::geography) as distance
from public.station_status

