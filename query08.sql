/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
select indego_trips_2019_q2.start_station, station_status.name, count(*)
from public.indego_trips_2019_q2
join station_status
on indego_trips_2019_q2.start_station = station_status.id
where extract(hour from start_time) > '07' and extract(hour from start_time) < '10'
group by indego_trips_2019_q2.start_station, station_status.name
order by count desc
limit 5

