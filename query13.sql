/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

WITH station_statuses AS (
  SELECT
  *,
  ST_Distance(
    ST_setsrid(ST_MakePoint(39.952296926596986, -75.19268734458572),4326),
    ST_MakePoint(latitude, longitude),
    FALSE
    ) AS meyerson_distance
  FROM public.lr_rt1mwwjuex9ienf202w
  ), 
  max_dist AS (
  SELECT 
    MAX(meyerson_distance) as max_distance
  FROM station_statuses
  )
SELECT
 cartodb_id as cartodb_id,
 id as station_id,
 name as station_name,
  meyerson_distance
FROM station_statuses
WHERE meyerson_distance = (SELECT max_distance FROM max_dist)

-- Answer: Station ID 3153, Station Name Thompson & Palmer, Adaire School, & a Meyerson Distance of 7000.08638912 meters