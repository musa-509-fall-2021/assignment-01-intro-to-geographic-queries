/*
  How many stations are within 1km of Meyerson Hall?
  ANSWER: 8
*/

-- Enter your SQL query here
with distance as ( 
  select st_distance(ST_Transform(the_geom::geometry, 3857),ST_Transform('SRID=4326; POINT( -75.19245084288279 39.952469494960795)'::geometry, 3857)) as dist_m
  from indego_station_statues
)

SELECT COUNT(*) 
FROM distance
WHERE dist_m < 1000 
