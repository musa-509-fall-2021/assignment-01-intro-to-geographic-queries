/*
  How many trips started on one day and ended in the next?
4332
*/

-- Enter your SQL query here
with count_2020 as(
  select *
  from indego_trips_2020_q2
  where to_date(start_time,'mm/dd/yyyy')-to_date(end_time,'mm/dd/yyyy')=-1
)

select sum(a) as Total_trips
from(
  select count(*) as a from count_2020
  union
  select count(*) as a
  from indego_trips_2019_q2
  where date(start_time)-date(end_time)=-1
)as b
