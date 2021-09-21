/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
select avg(st_distance(
  st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
  st_transform(the_geom, 3857)))
  from indego_station_statuses
  
-- Returned with 3733.772662085372.
