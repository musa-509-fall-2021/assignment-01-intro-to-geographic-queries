/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
SELECT avg(st_distance(the_geom, st_setsrid(st_point(-75.1948736, 39.9522363), 4326)::geography)) as avg_distance
from public.station_status

