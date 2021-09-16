/*
  What is the average duration of a trip for 2020?
  Answer - 39.23. One possible reason I can think of as to the increase would be Indego increasing the max amount of time they allow customers to use a device from one year to the next.
*/

-- Enter your SQL query here
select AVG(duration)
from indego_trips_2020_q2
