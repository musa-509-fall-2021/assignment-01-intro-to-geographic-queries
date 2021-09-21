/*
  Give the five most popular starting stations between 7am and 10am in 2019.
start_station --> trip occurence 

3057 --> 1791

3010 --> 1054

3054 --> 1053

3190 --> 887

3108 --> 836

*/

-- Enter your SQL query here


WITH hours_table as (
  SELECT start_station, EXTRACT(HOUR FROM start_time) as start_time
  FROM public.indego_trips_2019_q2
)
SELECT start_station,
  COUNT (start_station) AS trip_occurence
FROM hours_table
WHERE start_time BETWEEN 12 AND 15
GROUP BY start_station
ORDER BY trip_occurence DESC
LIMIT 5

/* I'm having trouble getting past this part. I tried doing:

SELECT start_station, start_time, count(start_station)
FROM indego_trips_2020_q2
WHERE CAST(start_time as time) >='07:00:00'
and CAST(start_time as time) <= '10:00:00'
GROUP BY indego_trips_2020_q2.start_station
ORDER BY count(start_station) desc

but get error about table name needing to appear in the group by clause
*/