/*
  What is the percent change in trips in Q2 2020 as compared to Q2 2019?
*/

-- Enter your SQL query here

WITH 
    trips_2020Q2 as (
        SELECT * FROM indego_trips_2020_q2
    )
SELECT to_char(
    (count(*) - 206354)/206354::float8 * 100, '99999.00%')
  AS perc_change
FROM trips_2020Q2

--Percent change in trips from 2019Q2 to 2020Q2 = -9.58%