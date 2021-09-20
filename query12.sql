/*
  How many stations are within 1km of Meyerson Hall?
*/

ANSWER - 14

-- Enter your SQL query here

SELECT COUNT(*) as close_to_meyerson FROM station_status
WHERE st_distance(the_geom, st_setsrid(st_makepoint(-75.19266128540039, 39.952233142941054), 4326), FALSE) < 1000
