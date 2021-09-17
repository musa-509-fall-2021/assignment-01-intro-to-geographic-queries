/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
with total_max_dur as (
	select count(*) as total from public.indego_trips_2019_q2
	where duration = (select max(duration) from public.indego_trips_2019_q2)
	union
	select count(*) as total from public.indego_trips_2020_q2
	where duration = (select max(duration) from public.indego_trips_2020_q2)
  )
select sum(total)
from total_max_dur

/*
Answer: The maximum duration recorded in the table is 1440, which is exactly 24 hours. Judging 
from the start time and end time, these trips are all trips greater than 24 hours, but they are 
all counted as 24 hours at the time of recording, resulting in there are so many trips of this 
duration.
*/