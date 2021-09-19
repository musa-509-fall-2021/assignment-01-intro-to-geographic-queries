/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
  ANSWER:3722.9228142180627
*/

-- Enter your SQL query here
select AVG(
  st_distance(ST_Transform(the_geom::geometry, 3857),
              ST_Transform('SRID=4326; 
                           POINT( -75.19245084288279 39.952469494960795)'::geometry, 
                           3857))
              ) as average_distance from indego_station_statues;
