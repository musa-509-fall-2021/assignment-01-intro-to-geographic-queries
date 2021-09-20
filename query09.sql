/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
with q2_passholders as (
SELECT passholder_type FROM public.indego_trips_2019_q2
UNION ALL 
SELECT passholder_type FROM public.indego_trips_2020_q2
)
select passholder_type, count (*)
from q2_passholders
group by passholder_type