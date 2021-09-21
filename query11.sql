/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
select ...


SELECT
 avg( st_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326),FALSE))
          as distance_from_meyerson
from indego_bikeshare_data_station_status_data


SELECT
    avg(the_geom <-> st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326))
       as distance_from_meyerson
FROM  indego_bikeshare_data_station_status_data
