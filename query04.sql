-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #4 --

/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here
select round(avg(duration),2) as avgDurQ2_2020
from indego_trips_2020_q2

-- **Result:** 39.24 Minutes