/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
with distance_to_meyerson as (
	select (the_geom <-> 'SRID=4326;POINT(-75.1923 39.9520)'::geometry) * 111139 as distance
	from indego_station_statuses
)
select count(*)
from distance_to_meyerson
where distance < 1000

RESULT: 10