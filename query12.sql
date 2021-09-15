/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
SELECT COUNT(distance_in_meters_from_meyerson) as count_stations_under_1km FROM 
  (SELECT id, name, ST_Distance(
        st_transform(ST_SetSRID(the_geom::geometry,4326),3857),
      st_transform(ST_SetSRID(POINT(-75.1927, 39.9522)::geometry,4326),3857)
    ) AS distance_in_meters_from_meyerson
  FROM station_status) as s
WHERE distance_in_meters_from_meyerson <= 1000