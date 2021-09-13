/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
with d as (
  select st_distance(
    ST_Transform(st_setsrid(st_point(-75.19264,39.95222), 4326), 3857),
    ST_Transform(the_geom, 3857)
  ) distance
  from indego_station_statuses
)
select count(distance) from d
where distance<=1000
