/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
select ...

SELECT
   count(*)
   st_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326)FALSE) as distance01 <1000
          as number01
          from


          SELECT
              avg(the_geom <-> st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326))
                 as distance_from_meyerson
          FROM  indego_bikeshare_data_station_status_data
