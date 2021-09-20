/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
  with all_records as(
  with all_time as(
  select  trip_id, start_time, end_time 
  from indego_trips_2019_q2
  union
  select trip_id, to_timestamp(start_time, 'mm/dd/yyyy hh24:mi') as start_time, to_timestamp(end_time, 'mm/dd/yyyy hh24:mi') as end_time
  from indego_trips_2020_q2)
  select trip_id, extract(month from start_time) as sm, extract(day from start_time) as sd,
  extract(month from end_time) as em, extract(day from end_time) as ed  from all_time)
  select count(*) from all_records
  where  (em-sm=0 and ed-sd=1)
  or (em=5 and sm=4 and ed=1 and sd=30)
  or (em=6 and sm=5 and ed=1 and sd=31)


/*
The query result: 4236
*/
