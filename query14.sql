/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
select name
from station_status
order by st_Distance(the_geom,st_setsrid(st_MakePoint(-75.1927, 39.9522),4326), false) 
limit 1
