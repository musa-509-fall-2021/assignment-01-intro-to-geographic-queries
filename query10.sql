/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
select st_distance(
  st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
  st_transform(the_geom, 3857)) 
  distance_from_Meyerson, id station_id, name station_name
  from indego_station_statuses
