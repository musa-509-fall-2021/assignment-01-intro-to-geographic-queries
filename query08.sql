/*
  Give the five most popular stations between 7am and 10am in 2019.
*/

WITH 
  commute_start_stations AS (
    SELECT
        start_station AS station,
        COUNT(*) AS station_uses
    FROM public.indego_trips_2020_q2
    WHERE EXTRACT(HOUR FROM (end_time)) < 10 AND EXTRACT(HOUR FROM (start_time)) > 6
    GROUP BY start_station
  ), commute_end_stations AS (
    SELECT
        end_station AS station,
        COUNT(*) AS station_uses
    FROM public.indego_trips_2020_q2
    WHERE EXTRACT(HOUR FROM (end_time)) < 10 AND EXTRACT(HOUR FROM (start_time)) > 6
    GROUP BY end_station
  ), commute_stations AS (
    SELECT 
      starts.station_uses + ends.station_uses as station_uses,
      ends.station as station
    FROM commute_start_stations AS starts
    JOIN commute_end_stations AS ends
    ON starts.station = ends.station   
  )
SELECT 
    *
FROM commute_stations
ORDER BY station_uses DESC
LIMIT 5

-- Answer: Top 5 Stations (Start & End Stations combined) between 7am & 10am: 3057 (1532 uses), 3052 (690 uses), 3102 (614 uses), 3010 (515 uses), 3208 (513 uses)