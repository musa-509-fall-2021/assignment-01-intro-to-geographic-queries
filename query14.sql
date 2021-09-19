/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
  
id  3255
name Chestnut & Broad
distance 3132.612699968969
*/

-- Enter your SQL query here
with distance as ( 
  select id, name, 
  st_distance(ST_Transform(the_geom::geometry, 3857),
              ST_Transform('SRID=4326; POINT( -75.19245084288279 39.952469494960795)'::geometry, 3857)
             ) as dist_m
  from indego_station_statues
)

SELECT id, name, dist_m
FROM distance
ORDER BY distance DESC
LIMIT 1
