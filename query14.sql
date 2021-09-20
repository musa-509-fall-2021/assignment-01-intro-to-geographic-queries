/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
with distance_to_meyerson as (
  select name, id,(the_geom <-> 'SRID=4326;POINT(-75.1923 39.9520)'::geometry) * 111139 as distance
	from indego_station_statuses
)
select * from distance_to_meyerson
order by distance asc
limit 1


RESULT: 3566 Spruce St
  3208
  198.6250139414629