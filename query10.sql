/*
  Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
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
)
SELECT 
  meyerson_distance
FROM station_statuses

-- Answer: