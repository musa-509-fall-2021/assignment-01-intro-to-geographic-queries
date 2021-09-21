/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
  The answer was a large table that I can not comment here. Just run the code.
*/

-- Enter your SQL query here
select st_distance(ST_Transform(the_geom::geometry, 3857),
                   ST_Transform('SRID=4326; POINT( -75.19245084288279 39.952469494960795)'::geometry, 3857))
                   as distance from indego_station_statues
