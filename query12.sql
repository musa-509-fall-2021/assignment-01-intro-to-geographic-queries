/*
  How many stations are within 1km of Meyerson Hall?
  14
*/

-- Enter your SQL query here
select count(*)
from real_time_station_status
where ST_DistanceSphere(the_geom,st_setsrid(st_makepoint(-75.19265726208687,39.95223622713292),4326)) < 1000
