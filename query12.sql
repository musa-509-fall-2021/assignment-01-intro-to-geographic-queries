/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
SELECT count(distance_in_meters_from_meyerson) AS count_stations_under_1km FROM 
  (SELECT id, name, st_distance(
    st_transform(st_setsrid(the_geom::geometry,4326),3857),
    st_transform(st_setsrid(point(-75.1927, 39.9522)::geometry,4326),3857)
  ) AS distance_in_meters_from_meyerson
  FROM station_status) AS s
WHERE distance_in_meters_from_meyerson <= 1000