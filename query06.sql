/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here

SELECT  count(*)
FROM (
    SELECT * from indego_trips_2019_q2
    union ALL
    SELECT * from indego_trips_2020_q2
) all_data
WHERE duration < 10