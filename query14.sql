/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT id, name, st_distance(
		st_transform(st_setsrid(the_geom::geometry,4326),3857),
	  	st_transform(st_setsrid(point(-75.1927, 39.9522)::geometry,4326),3857)
 	) AS distance_in_meters_from_meyerson,
	st_makeline(
		st_transform(st_setsrid(the_geom::geometry,4326),3857),
		st_transform(st_setsrid(point(-75.1927, 39.9522)::geometry,4326),3857)
	) AS line_geom
FROM station_status
ORDER BY distance_in_meters_from_meyerson ASC
LIMIT 1