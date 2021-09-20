/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
with q2_durations as (
SELECT duration FROM public.indego_trips_2019_q2
UNION ALL 
SELECT duration FROM public.indego_trips_2020_q2
)
select count (*)
from q2_durations
where duration <10

RESULT: 121687