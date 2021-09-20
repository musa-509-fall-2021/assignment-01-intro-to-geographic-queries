/*
  How many trips started on one day and ended in the next?
*/

-- For 2019:

SELECT 
	COUNT(trip_id)
FROM indego_trips_2019_q2 
WHERE EXTRACT(DAY from start_time) + 1 = EXTRACT(DAY from end_time)

-- For 2020:
SELECT 
	COUNT(trip_id)
FROM indego_trips_2020_q2 
WHERE EXTRACT(DAY from to_timestamp(start_time, 'MM-DD-YYYY HH24:MI')) + 1 = EXTRACT(DAY from to_timestamp(end_time, 'MM-DD-YYYY HH24:MI'))
