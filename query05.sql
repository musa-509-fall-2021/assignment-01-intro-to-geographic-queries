-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #5 --

/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
with indego_trips_Q2_19and20 as (
  select duration from indego_trips_2019_q2
  union
  select duration from indego_trips_2020_q2
)

select max(duration)
from indego_trips_Q2_19and20
