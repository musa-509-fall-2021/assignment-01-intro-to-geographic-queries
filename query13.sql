/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
  id:3183  name:15th & Kitty Hawk distance:7057.96m
*/

-- Enter your SQL query here

select id,
      name,
      round(cast(ST_DistanceSphere(the_geom,st_setsrid(st_makepoint(-75.19265726208687,39.95223622713292),4326))as numeric),2)::text || 'm'as distance
from real_time_station_status
order by ST_DistanceSphere(the_geom,st_setsrid(st_makepoint(-75.19265726208687,39.95223622713292),4326)) desc
limit 1
