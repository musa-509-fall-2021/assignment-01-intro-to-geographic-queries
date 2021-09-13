/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
select st_distance(
  ST_Transform(st_setsrid(st_point(-75.19264,39.95222),4326), 3857),
  ST_Transform(the_geom, 3857)
) distance_from_Meyerson, id station_id, name station_name
from indego_station_statuses
