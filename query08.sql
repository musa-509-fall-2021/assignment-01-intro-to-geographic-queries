/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
SELECT start_station,
  COUNT(*)
  FROM  indego_trips_2019_q2
  WHERE TRIM(to_char(start_time, 'HH24')) LIKE '07' or 
       TRIM(to_char(start_time, 'HH24')) LIKE '08' or 
       TRIM(to_char(start_time, 'HH24')) LIKE '09'
  GROUP BY start_station

-- when order by DESC, returned with start_statio(s) of 3102, 3012, 3007, 3064, 3100
