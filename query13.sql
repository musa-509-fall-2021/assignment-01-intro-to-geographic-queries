/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
select name station_name, id station_id, st_distance(
  st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
  st_transform(the_geom, 3857)) distance_from_Meyerson
  from indego_station_statuses
  order by distance_from_Meyerson DESC
  
-- Returned with station_name: 15th & Kitty Hawk; station_id: 3183; distance_from_meyerson: 9221.052730085898.
