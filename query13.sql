/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
with meyerson_hall as (
    select 'SRID=4326; POINT(-75.1927385462581  39.95244189189052)'::geometry as the_geom
)

select s.name
from indego_station_statuses as s
join meyerson_hall as h on true
order by st_transform(s.the_geom, 2272) <-> st_transform(h.the_geom, 2272) desc
limit 1
