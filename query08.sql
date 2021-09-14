/*
  Give the five most popular stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here


------- only starting statioins -------
SELECT station, sum(times) times
FROM (
  -- get start_station when start_time in the period
  SELECT  start_station station,COUNT(*) times
  FROM indego_trips_2019_q2
  WHERE extract(hour FROM to_timestamp(start_time, 'YYYY-MM-DD HH24:MI:SS')) BETWEEN 7 AND 10 
  GROUP BY  start_station
) starting_stations
GROUP BY  station
ORDER BY SUM(times) DESC LIMIT 5;


------- all statioins -------
SELECT station, sum(times) times
FROM (
  -- get start_station when start_time in the period
  SELECT  start_station station,COUNT(*) times
  FROM indego_trips_2019_q2
  WHERE extract(hour FROM to_timestamp(start_time, 'YYYY-MM-DD HH24:MI:SS')) BETWEEN 7 AND 10 
  GROUP BY  start_station
  UNION ALL
  -- get end_station when end_time in the period
  SELECT  end_station station,COUNT(*) times
  FROM indego_trips_2019_q2
  WHERE extract(hour FROM to_timestamp(end_time, 'YYYY-MM-DD HH24:MI:SS')) BETWEEN 7 AND 10 
  GROUP BY  end_station
) filtered_stations
GROUP BY  station
ORDER BY SUM(times) DESC LIMIT 5;