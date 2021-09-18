-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #10 --
/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
select 
  name,
  trunc(st_distance(
    st_transform(st_setsrid(st_makepoint(-75.19265, 39.95224),4326),3857),
    st_transform(the_geom,3857) 
  )::numeric, 2) as metersFromMeyerson
  
from indego_station_statuses
order by metersFromMeyerson asc

