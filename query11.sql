/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
with d as (
  select st_distance(
    ST_Transform(st_setsrid(st_point(-75.19264,39.95222), 4326), 3857),
    ST_Transform(the_geom, 3857)
  ) distance
  from indego_station_statuses
)
select round(avg(distance)::numeric,2) from d