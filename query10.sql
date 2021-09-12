/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT indego_station_statuses.id,indego_station_statuses.name,(st_distance(the_geom, 'POINT(-75.19268489458014 39.95241719826734)'::geography))::text||'m' AS distance
FROM indego_station_statuses 
