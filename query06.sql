/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here
SELECT TIMESTAMP_DIFF(end_time,start_time,minute) FROM indego_trips_2020_q2
