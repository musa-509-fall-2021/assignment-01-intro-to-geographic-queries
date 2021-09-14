/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here

SELECT  COUNT(*)
FROM (
  SELECT *
  FROM indego_trips_2019_q2
  WHERE to_date(end_time, 'YYYY-MM-DD') - to_date(start_time, 'YYYY-MM-DD') = 1 UNION
  SELECT *
  FROM indego_trips_2020_q2
  WHERE to_date(end_time, 'MM/DD/YYYY') - to_date(start_time, 'MM/DD/YYYY') = 1 
) target_table

-- It cannot be done easily with EXTRACT (as is hinted in the readme), 
-- because there is cases of 31th -> 1st.