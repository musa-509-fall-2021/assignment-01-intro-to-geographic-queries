/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
select name
from indego_bikeshare_data_station_status_data
order by ST_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326))asc
limit 1;
