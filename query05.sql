/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
select max(duration) as longest_duration, count(*) as amount_trips
from indego_trips_2019_q2
where duration = 
  (
  select max(duration) 
  from indego_trips_2019_q2
  )


#Why are there so many trips of this duration?
#Answer: Because that is the duration limit in the system or database, even for those trips that are longer than 1440 mins (1day) the duration records will be 1440.
