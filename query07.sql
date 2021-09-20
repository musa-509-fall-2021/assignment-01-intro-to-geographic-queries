/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
with q2_days as (
SELECT start_time, end_time, EXTRACT(DAY FROM start_time) as start_day, EXTRACT (DAY FROM end_time) as end_day FROM public.indego_trips_2019_q2
UNION ALL 
SELECT start_time::date, end_time::date, EXTRACT(DAY FROM start_time::date) as start_day, EXTRACT (DAY FROM end_time::date) as end_day FROM public.indego_trips_2020_q2
)
select count (*)
from q2_days
where start_day != end_day

RESULT: 4782