/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
with all_trip_durations as (
    select trip_id, duration
    from indego_trips_2019_q2

    union all

    select trip_id, duration
    from indego_trips_2020_q2
)

select max(duration)
from all_trip_durations
