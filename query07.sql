-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #7 --

/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
with indego_trips_Q2_19and20 as (
  /* select extract(day from start_time), 
        extract(day from end_time) 
        from indego_trips_2019_q2
  union */
  select /* extract(day from */ to_date(start_time,'MM/DD/YYYY')/* ) */, 
        /* extract(day from */ to_date(end_time,'MM/DD/YYYY')/* )  */
        from indego_trips_2020_q2
)

select * /* count(duration > 10) as tripsLess10Min */
from indego_trips_Q2_19and20