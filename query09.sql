/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
with all_trips as (
    select trip_id, passholder_type
    from indego_trips_2019_q2

    union all

    select trip_id, passholder_type
    from indego_trips_2020_q2
)

select passholder_type, count(*) as num_trips
from all_trips
group by passholder_type
