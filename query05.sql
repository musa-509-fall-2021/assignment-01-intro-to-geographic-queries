/*
  What is the longest duration trip? Why are there so many trips of this duration?
  ANSWER: For 2020 the longest duration trip is 1440, while for 2019 it is also 1440.
  I think 
*/

-- Enter your SQL query here
SELECT MAX(duration) FROM indego_trips_2020_q2
SELECT MAX(duration) FROM indego_trips_2019_q2
