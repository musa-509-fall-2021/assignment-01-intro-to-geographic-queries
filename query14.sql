/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT MIN (st_distance(the_geom::geography,st_setsrid(st_makepoint(-75.19265592098236,39.95222903068502)::geography,4326)))FROM indego_station_statuses