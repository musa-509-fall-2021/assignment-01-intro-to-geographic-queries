/*
  What is the longest duration trip?
  Answer - 1440. 1440 minutes = 24 hours. 
  I would venture to guess that the max amount of time for which you can rent a bike is 24 hours. 
  After that, the rental likely maxes out and once again becomes available for rent.
*/

-- Enter your SQL query here
select *
from indego_trips_2020_q2
order by duration desc
