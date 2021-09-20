/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
select addressstreet, (the_geom <-> 'SRID=4326;POINT(-75.1923 39.9520)'::geometry) * 111139 as distance_to_Meyerson
from indego_station_statuses