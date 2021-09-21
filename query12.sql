/*
  How many stations are within 1km of Meyerson Hall?

  160

*/

-- Enter your SQL query here

SELECT
    count(name)
FROM indego_station_statuses 
WHERE ST_DWithin(the_geom, ST_SetSRID(ST_Point(-75.1923, 39.9520), 4326), 1000)


