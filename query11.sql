/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
SELECT AVG (st_distance(the_geom::geography,st_setsrid(st_makepoint(-75.19265592098236,39.95222903068502)::geography,4326)))FROM indego_station_statuses
