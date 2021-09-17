/*
  What is the longest duration trip?
*/

-- Enter your SQL query here
select max(duration) as max_2020
from indego_trips_2020_q2

/*
Why are there so many trips of this duration?

Answer:

Because 1440 minutes equal to 24 hours which is the maximum duration of a single day.

*/