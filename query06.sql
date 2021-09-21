/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
with all_trip_durations as (
    select trip_id, duration
    from indego_trips_2019_q2

    union all

    select trip_id, duration
    from indego_trips_2020_q2
)

select count(*)
from all_trip_durations
where duration < 10
