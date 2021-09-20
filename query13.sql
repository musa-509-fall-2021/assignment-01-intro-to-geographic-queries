/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
with distance_to_meyerson as (
  select name, id,(the_geom <-> 'SRID=4326;POINT(-75.1923 39.9520)'::geometry) * 111139 as distance
	from indego_station_statuses
)
select * from distance_to_meyerson
order by distance desc
limit 1

RESULT: 448 East Thompson Street
  3153
  7283.798746543411