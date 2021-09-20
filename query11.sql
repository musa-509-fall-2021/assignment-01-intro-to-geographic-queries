/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
select avg((the_geom <-> 'SRID=4326;POINT(-75.1923 39.9520)'::geometry) * 111139)
	from indego_station_statuses

RESULT: 3417.956514036272