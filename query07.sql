/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
select sum(sum1) FROM
(select count(*) as sum1
from indego_trips_2020_q2
where to_date(start_time,'MM/DD/YYYY')
=to_date(end_time,'MM/DD/YYYY')-1
union all
select count(*) as sum1
from indego_trips_2019_q2
where date(start_time)=date(end_time)-1
)d
