/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
with results as (
  select to_timestamp(start_time, 'mm/dd/yyyy hh24:mi') as stime, to_timestamp(end_time, 'mm/dd/yyyy hh24:mi') as etime
  from indego_trips_2020_q2
  where (extract(month from to_timestamp(end_time, 'mm/dd/yyyy hh24:mi')) - extract(month from to_timestamp(start_time, 'mm/dd/yyyy hh24:mi'))=0
  and extract(day from to_timestamp(end_time, 'mm/dd/yyyy hh24:mi')) - extract(day from to_timestamp(start_time, 'mm/dd/yyyy hh24:mi'))=1)
  or
  (extract(month from to_timestamp(end_time, 'mm/dd/yyyy hh24:mi'))=5 and extract(month from to_timestamp(start_time, 'mm/dd/yyyy hh24:mi'))=4
  and extract(day from to_timestamp(end_time, 'mm/dd/yyyy hh24:mi'))=1 and extract(day from to_timestamp(start_time, 'mm/dd/yyyy hh24:mi'))=30)
  or
  (extract(month from to_timestamp(end_time, 'mm/dd/yyyy hh24:mi'))=6 and extract(month from to_timestamp(start_time, 'mm/dd/yyyy hh24:mi'))=5
  and extract(day from to_timestamp(end_time, 'mm/dd/yyyy hh24:mi'))=1 and extract(day from to_timestamp(start_time, 'mm/dd/yyyy hh24:mi'))=31)
  )
select count(*) from results
