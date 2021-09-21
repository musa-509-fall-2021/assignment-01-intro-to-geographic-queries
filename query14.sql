/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
select *
from indego_bikeshare_data_station_status_data
order by ST_distance(the_geom,st_setsird(st_makepoint(-75.19263125091902,39.95238429917612),4236))desc
limit 1
