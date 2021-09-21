/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
  
ANSWER: 
id  3183
station name 15th & Kitty Hawk
distance 9242.068380699047
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
ORDER BY dist_m DESC
LIMIT 1
