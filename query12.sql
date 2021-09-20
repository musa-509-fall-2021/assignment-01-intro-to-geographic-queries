/*
  How many stations are within 1km of Meyerson Hall?
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
  COUNT(meyerson_distance) AS stations_within_1km
FROM station_statuses
WHERE meyerson_distance <= 1000

-- Answer: 21 stations within 1km of Meyerson