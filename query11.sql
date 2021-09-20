/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
select 
	AVG(ST_Distance(
      ST_Transform(the_geom, 3857), 
      ST_Transform('SRID=4326;POINT(-75.19266128540039 39.95223725519681)'::geometry, 3857)))
from public.a_tgbqkercddrih5lwa1zg
