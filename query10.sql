/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT id, name, ST_Distance(
  		st_transform(ST_SetSRID(the_geom::geometry,4326),3857),
		st_transform(ST_SetSRID(POINT(-75.1927, 39.9522)::geometry,4326),3857)
	) AS distance_in_meters_from_meyerson
FROM station_status
ORDER BY distance_in_meters_from_meyerson asc