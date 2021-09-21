/*
  What is the longest duration trip? Why are there so many trips of this duration?
  ANSWER: The longest duration trip is 1440. 
  This riding lasted for about three days. I infered that this is a shared bike taken by many travellers.
*/

-- Enter your SQL query here
SELECT longest_trip
FROM(
  SELECT MAX(duration) AS longest_trip FROM indego_trips_2019_q2
  UNION
  SELECT MAX(duration) AS longest_trip FROM indego_trips_2020_q2
  ) AS Q5
