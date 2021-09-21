/*
  What is the average distance (in meters) of all stations from Meyerson Hall?

3419.45

*/

-- Enter your SQL query here

SELECT avg((the_geom <-> ST_SETSRID(ST_MAKEPOINT(-75.1923, 39.9520), 4326)::geometry)) * 111139 as distance_to_meyerson
FROM indego_station_statuses