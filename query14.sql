/*
  Which station is closest to Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT id, name, ST_Distance(
  		st_transform(ST_SetSRID(the_geom::geometry,4326),3857),
	  	st_transform(ST_SetSRID(POINT(-75.1927, 39.9522)::geometry,4326),3857)
	) AS distance_in_meters_from_meyerson,
  ST_MakeLine(
  		st_transform(ST_SetSRID(the_geom::geometry,4326),3857),
	  	st_transform(ST_SetSRID(POINT(-75.1927, 39.9522)::geometry,4326),3857)
  ) AS line_geom
FROM station_status
ORDER BY distance_in_meters_from_meyerson asc
LIMIT 1

--
-- alternatively, this is the code I used to create a map in Carto
select sa.cartodb_id, sa.name, sa.line_geom, st_transform(sa.line_geom, 3857) as the_geom_webmercator FROM
(SELECT id as cartodb_id, name, the_geom, st_transform(the_geom,3857) as the_geom_webmercator, ST_Distance(
  		st_transform(ST_SetSRID(the_geom::geometry,4326),3857),
	  	st_transform(ST_SetSRID(POINT(-75.1927, 39.9522)::geometry,4326),3857)
	) AS distance_in_meters_from_meyerson,
  ST_MakeLine(
  		st_transform(ST_SetSRID(the_geom::geometry,4326),3857),
	st_transform(ST_SetSRID(POINT(-75.1927, 39.9522)::geometry,4326),3857)
  ) AS line_geom
FROM station_status
ORDER BY distance_in_meters_from_meyerson asc
LIMIT 1) AS sa