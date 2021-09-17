/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
select count(*), '2019' as year from public.indego_trips_2019_q2
where duration < 10
union
select count(*), '2020' as year from public.indego_trips_2020_q2
where duration < 10

