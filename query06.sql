/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
SELECT COUNT(*) AS shorter_than_ten
FROM indego_trips_2020_q2
WHERE duration < 10

-- result:46729
