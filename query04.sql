/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here
SELECT AVG (duration)
FROM indego_trips_2020_q2

--I think it's because under the condition of covid 19,
--people prefer to ride bike instead of taking public transportation,which lead to longer duration
--of each trip.
