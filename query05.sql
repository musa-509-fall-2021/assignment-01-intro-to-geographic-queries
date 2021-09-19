/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
with indego_trips as(
  SELECT duration
    FROM indego_trips_2019_q2
  UNION
  SELECT duration
    FROM indego_trips_2020_q2)

SELECT  max(duration)
from indego_trips