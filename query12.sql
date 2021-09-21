/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
SELECT COUNT (*) FROM indego_station_statuses
WHERE (st_distance(the_geom::geography,st_setsrid(st_makepoint(-75.19265592098236,39.95222903068502)::geography,4326))) < 1000