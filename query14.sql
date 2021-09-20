/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

Answer - 201.08558757

-- Enter your SQL query here
SELECT name, st_distance(the_geom, st_setsrid(st_makepoint(-75.19266128540039, 39.952233142941054), 4326), FALSE) as distance_from_meyerson
FROM station_status
ORDER BY distance_from_meyerson asc
LIMIT 1
