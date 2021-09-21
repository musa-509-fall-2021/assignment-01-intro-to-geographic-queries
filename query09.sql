-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #9 --

/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
with indego_trips_Q2_19and20 as (
  select trip_id, passholder_type 
  from indego_trips_2019_q2
  union
  select trip_id,passholder_type 
  from indego_trips_2020_q2
)

select passholder_type, count(*) as numtrips
from indego_trips_Q2_19and20
group by passholder_type
order by passholder_type

-- **Answer:** 
-- 1. Day Pass - 72,362 trips
-- 2. Indego30 - 263,249 trips
-- 3. Indego365 - 56,358 trips
-- 4. IndegoFlex - 852 trips
-- 5. NULL - 35 trips
-- 6. Walk-up - 84 trips