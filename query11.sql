/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
SELECT avg(st_distance(
  		st_transform(st_setsrid(the_geom::geometry,4326),3857),
		st_transform(st_setsrid(point(-75.1927, 39.9522)::geometry,4326),3857)
	)) AS avg_distance_in_meters_from_meyerson
FROM station_status