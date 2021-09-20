/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
select max(duration) 
from 
(select duration from indego_trips_2020_q2
UNION
select duration from indego_trips_2019_q2) as total

/*
Why are there so many trips of this duration?

Answer:

Because 1440 minutes equal to 24 hours which is the maximum duration of a single day.

*/

/*
The query result: 9
*/