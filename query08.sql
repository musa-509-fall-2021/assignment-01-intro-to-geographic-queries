/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
with all_trips as (
    select trip_id, start_station, start_time
    from indego_trips_2019_q2

    union all

    select trip_id, start_station, to_timestamp(start_time, 'MM/DD/YYYY HH24:MI') as start_time
    from indego_trips_2020_q2
)

select start_station, count(*) as num_trips
from all_trips
where extract(hour from start_time) between 7 and 10
group by start_station
order by num_trips desc

/*
  Or, alternatively:

  select start_station, count(*) as num_trips
  from all_trips
  where start_time::time between '07:00' and '10:00'
  group by start_station
  order by num_trips desc
*/
