/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
select name,
      id,
      round (cast(ST_DistanceSphere(the_geom,st_setsrid(st_makepoint(-75.19265726208687,39.95223622713292),4326))as numeric),2)::text||'m'as distance
from real_time_station_status
