/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here

SELECT AVG(st_distance(the_geom, st_setsrid(st_makepoint(-75.19266128540039, 39.952233142941054), 4326), FALSE)) as distance_from_meyerson
FROM station_status
