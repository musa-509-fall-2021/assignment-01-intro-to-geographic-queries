/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
with d as (
  select st_distance(
    ST_Transform(st_setsrid(st_point(-75.19264,39.95222), 4326), 3857),
    ST_Transform(the_geom, 3857)
  ) distance, id station_id, name station_name
  from indego_station_statuses
)
select * from d
order by distance limit 1 