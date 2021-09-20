/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
with q2_durations as (
SELECT duration FROM public.indego_trips_2019_q2
UNION ALL 
SELECT duration FROM public.indego_trips_2020_q2
)
select max(duration)
from q2_durations

RESULT: 1440