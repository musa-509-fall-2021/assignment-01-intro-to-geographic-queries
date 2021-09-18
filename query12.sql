-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #12 --

/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
with distFromMeyerson as (
  select
    trunc(st_distance(
      st_transform(st_setsrid(st_makepoint(-75.19265, 39.95224),4326),3857),
      st_transform(the_geom,3857) 
    )::numeric, 2) as metersFromMeyerson
  from indego_station_statuses
) 

select count(*) filter(
  where metersFromMeyerson <= 1000) as NumStations_wIn_1kmMeyerson
from distFromMeyerson