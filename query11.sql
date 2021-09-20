/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
select name, st_Distance(the_geom,st_setsrid(st_MakePoint(-75.1927, 39.9522),4326), false) as distance_from_Meyerson
from station_status
