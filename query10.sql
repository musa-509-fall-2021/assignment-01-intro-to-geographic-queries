/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

-- Enter your SQL query here

CREATE EXTENSION postgis;

CREATE TABLE stations_geom AS
  select id, name,
    ST_SetSRID(ST_MakePoint(longitude,latitude),4326) as geom
  FROM station_status
;

CREATE INDEX stations_gix
  ON stations_geom
  USING GIST (geom)
;

CREATE TABLE distances AS
  SELECT id, name,
    ST_Distance('SRID=4326;POINT(-75.1926852 39.9522399)'::geography, geom::geography) as meyerson_dist
  FROM stations_geom
;

SELECT * from distances;
