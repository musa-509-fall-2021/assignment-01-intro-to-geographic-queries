/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here
SELECT indego_station_statuses.id,
		indego_station_statuses.name,
      st_transform(st_setsrid(the_geom, 4326), 3857) as the_geom_webmercator,
      st_distance(st_transform(st_setsrid(the_geom, 4326), 3857), st_transform(st_setsrid(st_makepoint(-75.1926 ,39.9522), 4326), 3857)
                 ) AS distance
from indego_station_statuses
