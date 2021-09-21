/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
with all_trips as (
    select trip_id, start_time, end_time
    from indego_trips_2019_q2

    union all

    select trip_id, to_date(start_time, 'MM/DD/YYYY'), to_date(end_time, 'MM/DD/YYYY')
    from indego_trips_2020_q2
)

select count(*)
from all_trips
where extract(day from end_time) - extract(day from start_time) = 1
    or (
        extract(month from end_time) - extract(month from start_time) = 1
        and extract(day from end_time) = 1
        and extract(day from start_time) = case
            when extract(month from start_time) in (4, 6) then 30
            else 31 end
    )

/*
  Alternatively, and more simply:

  with all_trips as (
      select trip_id, start_time, end_time
      from indego_trips_2019_q2

      union all

      select trip_id, to_date(start_time, 'MM/DD/YYYY'), to_date(end_time, 'MM/DD/YYYY')
      from indego_trips_2020_q2
  )

  select count(*)
  from all_trips
  where end_time::date - start_time::date = 1
*/
