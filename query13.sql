-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #13 --

/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
select 
  name, id,
  trunc(st_distance(
    st_transform(st_setsrid(st_makepoint(-75.19265, 39.95224),4326),3857),
    st_transform(the_geom,3857) 
  )::numeric, 2) as metersFromMeyerson
  
from indego_station_statuses
order by metersFromMeyerson desc
limit 1


-- **Answer:** 15th & Kitty Hawk (Station ID: 3183) is 9213.56 meters from Meyerson Hall