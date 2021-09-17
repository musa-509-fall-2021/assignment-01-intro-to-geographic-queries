/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
select cartodb_id, the_geom, id, name, addressstreet, 
st_distance(ST_Transform(the_geom::geometry, 3857), ST_Transform('SRID=4326;POINT(-75.19266128540039 39.952204357143664)'::geometry, 3857)) as distance_meter
from station_status