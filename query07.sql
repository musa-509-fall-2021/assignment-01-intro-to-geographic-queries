/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here
select count(*), '2019' as year 
from public.indego_trips_2019_q2
where extract(day from start_time) = extract(day from end_time) - 1
union
select count(*), '2020' as year
from public.indego_trips_2020_q2
where extract(day from to_date(start_time, 'MM/DD/YYYY HH24/MI/SS')) = extract(day from to_date(end_time, 'MM/DD/YYYY HH24/MI/SS')) - 1

