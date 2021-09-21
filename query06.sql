-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #6 --

/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
with indego_trips_Q2_19and20 as (
  select duration from indego_trips_2019_q2
  union
  select duration from indego_trips_2020_q2
)

select count(duration > 10) as tripsLess10Min
from indego_trips_Q2_19and20

--     **Answer:** 1228 trips in Q2 of 2019 and Q2 of 2020 in total