/*
  What is the longest duration trip? Why are there so many trips of this duration?
  ANSWER: The longest duration trip for both 2019 and 2020 is 1440, with a One Way, Day Pass and standard bike. 
  This riding lasted for about three days. I infered that this is a shared bike taken by many travellers.
*/

-- Enter your SQL query here
SELECT AVG(duration) FROM indego_trips_2019_q2
SELECT AVG(duration) FROM indego_trips_2020_q2

/* For a more detailed querying to answer why there so many trips of this duration: */
SELECT * FROM indego_trips_2019_q2
ORDER BY duration DESC
LIMIT 1

SELECT * FROM indego_trips_2020_q2
ORDER BY duration DESC
LIMIT 1
