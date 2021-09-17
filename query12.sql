/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
select count(*) 
from public.station_status 
where st_dwithin(the_geom, ST_SetSRID(ST_Point(-75.1948736, 39.9522363), 4326)::geography, 1000)

