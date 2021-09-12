/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT indego_station_statuses.id,indego_station_statuses.name,st_distance(ST_Transform(the_geom,4326)::geography, ST_Transform('SRID=4326;POINT(-75.19268489458014 39.95241719826734)'::geometry,4326)::geography) AS distance
FROM indego_station_statuses 
