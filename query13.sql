/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
  
ANSWER: 
id  3004
number Municipal Services Building Plaza
name 3201.737297227914
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
ORDER BY distance ASC
LIMIT 1
