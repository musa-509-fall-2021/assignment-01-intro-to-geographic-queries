/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
with distances as(
select cartodb_id, the_geom, id, name, addressstreet, 
st_distance(ST_Transform(the_geom::geometry, 3857), ST_Transform('SRID=4326;POINT(-75.19266128540039 39.952204357143664)'::geometry, 3857)) as distance_meter
from station_status)
select id, name, distance_meter as distance_from_meyerson
from distances
order by distance_meter
limit 1
