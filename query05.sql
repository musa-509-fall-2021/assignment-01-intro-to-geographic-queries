/*
  What is the longest duration trip?
*/

-- Enter your SQL query here

SELECT  *
FROM (
  SELECT  * FROM indego_trips_2019_q2
  UNION ALL
  SELECT  * FROM indego_trips_2020_q2
) all_data
WHERE duration = (
  SELECT  MAX(duration)
  FROM indego_trips_2019_q2
)

