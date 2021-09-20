/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
select count(*) as amount_within_1km
from station_status
where st_Distance(the_geom,st_setsrid(st_MakePoint(-75.1927, 39.9522),4326), false) < 1000
