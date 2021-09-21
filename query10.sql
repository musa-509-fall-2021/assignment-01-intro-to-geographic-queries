/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
Meyerson
-75.19263125091902 39.95238429917612

--***solution first****
SELECT
   name, st_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326),FALSE)
          as distance_from_meyerson
from indego_bikeshare_data_station_status_data


--***solution second****
SELECT
      name, the_geom <-> (st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326),FALSE)
       as distance_from_meyerson
FROM  indego_bikeshare_data_station_status_data

还没改成meter
