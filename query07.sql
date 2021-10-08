-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #7 --

/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
with q2_19 as (
  select extract(day from start_time) as startDay19, 
        extract(day from end_time) as endDay19
        from indego_trips_2019_q2
)

select count(*) filter(where startDay19 <> endDay19) as difDayTrips
from q2_19

-- **Answer:** 1782 trips in Q2 of 2019 and Q2 of 2020 in total