-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #3 --

/*
  What is the average duration of a trip for 2019?
*/

-- Enter your SQL query here
select round(avg(duration),2) as avgDurQ2_2019
from indego_trips_2019_q2

-- **Result:** 23.67 Minutes

