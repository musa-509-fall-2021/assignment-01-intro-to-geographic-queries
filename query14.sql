/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
select name station_name, id station_id, st_distance(
  st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
  st_transform(the_geom, 3857)) distance_from_Meyerson
  from indego_station_statuses
  order by distance_from_Meyerson ASC

-- Returned with 34th & Spruce (station_id:3208; distance_from_meyerson: 273.72368554731594 meters).
