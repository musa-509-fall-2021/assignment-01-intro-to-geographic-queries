/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
with q2_starts as (
	SELECT start_time, start_station, EXTRACT(HOUR FROM start_time) as start_hour FROM public.indego_trips_2019_q2
)
select start_station, count(*)
from q2_starts
where start_hour between 11 and 14
group by start_station
order by count(*) desc
limit 5

RESULT: Stations 3057, 3010, 3054, 3190, 3032