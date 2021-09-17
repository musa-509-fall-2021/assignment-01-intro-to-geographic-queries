/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
with distances as(
select cartodb_id, the_geom, id, name, addressstreet, 
st_distance(ST_Transform(the_geom::geometry, 3857), ST_Transform('SRID=4326;POINT(-75.19266128540039 39.952204357143664)'::geometry, 3857)) as distance_meter
from station_status)
select count(*)
from distances
where distance_meter <1000