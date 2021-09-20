/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
select *
from public.a_tgbqkercddrih5lwa1zg
order by the_geom <-> st_setsrid(st_makepoint(-75.19266128540039, 39.95223725519681), 4326) DESC
limit 1
