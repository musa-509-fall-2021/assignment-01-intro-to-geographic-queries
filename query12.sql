/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
WITH distance_all AS (SELECT indego_station_statuses.id,indego_station_statuses.name,
                      st_distance(ST_Transform(the_geom,4326)::geography, 
                                  ST_Transform('SRID=4326;POINT(-75.19268489458014 39.95241719826734)'::geometry,4326)::geography) 
                      AS distance
FROM indego_station_statuses)

SELECT COUNT(*) 
FROM distance_all
WHERE distance < 1000

--result:14
