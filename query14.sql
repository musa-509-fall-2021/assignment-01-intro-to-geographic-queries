/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
with dis_to_MH as (
	SELECT id, name, st_distance(the_geom, st_setsrid(st_point(-75.1948736, 39.9522363), 4326)::geography) as distance
	from public.station_status
 )
select id, name, distance
from dis_to_MH
where distance = (select min(distance) from dis_to_MH)

