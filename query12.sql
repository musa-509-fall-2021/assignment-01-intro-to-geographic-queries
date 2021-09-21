/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
with distance_table as(
  select st_distance(
  st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
  st_transform(the_geom, 3857)) distance
  from indego_station_statuses)
 select count(distance) from distance_table
  where distance <= 1000
 
-- Returned with 8.
