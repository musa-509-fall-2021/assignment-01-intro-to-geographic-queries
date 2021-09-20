/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here

with distances as(
select cartodb_id, the_geom, id, name, addressstreet, 
st_distance(ST_Transform(the_geom::geometry, 3857), ST_Transform('SRID=4326;POINT(-75.19266128540039 39.952204357143664)'::geometry, 3857)) as distance_meter
from station_status)
select avg(distance_meter) as average_distance
from distances as average_distance


/*
The query result: 3741.3290790517144
*/