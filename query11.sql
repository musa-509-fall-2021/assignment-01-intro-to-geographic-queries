/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
  2862.23m
*/

-- Enter your SQL query here
select round(cast(avg(distance)as numeric),2)::text||'m' as distance
from (
  select ST_DistanceSphere(the_geom,st_setsrid(st_makepoint(-75.19265726208687,39.95223622713292),4326))as distance
  from real_time_station_status) as D
