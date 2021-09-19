/*
  What is the longest duration trip? Why are there so many trips of this duration?
  ANSWER: For 2020 the longest duration trip is 1440
  While for 2019 the longest duration is also 1440. In detail, it is a One Way, Day Pass and standard bike one.

*/

-- Enter your SQL query here
SELECT * FROM indego_trips_2019_q2
ORDER BY duration DESC
LIMIT 1

SELECT * FROM indego_trips_2020_q2
ORDER BY duration DESC
LIMIT 1
