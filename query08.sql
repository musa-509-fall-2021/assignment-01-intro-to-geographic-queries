-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #8 --
/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here

select s.station_name, count(*)
      filter (where (extract(hour from start_time) >= 7) and
                    (extract(hour from end_time) <= 10)
              ) as tripCount
from indego_trips_2019_q2 t
inner join indego_stations s 
on t.start_station = s.station_id
group by s.station_name
order by tripCount desc
limit 5

  -- **Answer:** 
  -- 1. Pennsylvania & Fairmount Perelman Building - 1280 rides
  -- 2. 21st & Catharine - 1088 rides
  -- 3. 11th & Pine, Kahn Park - 858 rides
  -- 4. 18th & Washington, Chew Playground - 836 rides
  -- 5. Moyamensing & Tasker - 792 rides