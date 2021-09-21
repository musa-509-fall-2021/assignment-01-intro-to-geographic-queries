/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.

  Too many to list, but see query below
  
*/

-- Enter your SQL query here

SELECT name, (the_geom <-> ST_SETSRID(ST_MAKEPOINT(-75.1923, 39.9520), 4326)::geometry) * 111139 as distance_to_meyerson
FROM indego_station_statuses