/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
select name, st_Distance(the_geom,st_setsrid(st_MakePoint(39.9522, -75.1927),4326), false) as distance_from_Meyerson
from station_status
