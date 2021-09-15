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




/* 
While it wasn't necessary, I was able to calculate the average across all four quarters:

with indego_trips_2019 as (
  select duration from indego_trips_2019_q1
  union
  select duration from indego_trips_2019_q2
  union
  select duration from indego_trips_2019_q3
  union
  select duration from indego_trips_2019_q4
)

select avg(duration)
from indego_trips_2019 */