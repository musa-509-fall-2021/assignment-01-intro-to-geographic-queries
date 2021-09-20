/*
  Give the five most popular stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
select start_station as pop_stations
FROM indego_trips_2019_q2
where extract(hour from start_time) in (7,10)
GROUP BY start_station
ORDER BY count(*) DESC
limit 5
