
MUSA 508 
Olivia Scalora
Assignment 1
09/19/21

/*
 1. Example: How many bike trips in Q2 2019
*/

SELECT COUNT(*)
    FROM indego_trips_2019_q2

--> 	
206354 bike trips

/*
  2. What is the percent change in trips in Q2 2020 as compared to Q2 2019?
  Using only the table from Q2 2020 and the number calculated in the previous
  question, find the percent change of number of trips in Q2 2020 as compared
  to 2019. Remember you can do calculations in the select clause.
*/

WITH count2019 AS (
    SELECT 0 AS id,
    COUNT(*) AS trips19
    FROM indego_trips_2019_q2
    ) ,

    count2020 AS (
    SELECT 0 AS id, 
    COUNT(*) AS trips20
    FROM indego_trips_2020_q2
    )

SELECT count2019, 
       count2020, 
       ((trips20::FLOAT-trips19::FLOAT)/trips19*100)::TEXT || '%'
            AS pctchange
    FROM count2019
    INNER JOIN count2020
    ON count2019.id=count2020.id


/*
  Bonus: If you want to get fancier here, you can cast the result to a string
  and concatenate a '%' to the end. For example:
      (10 + 3.2)::text || '%' AS perc_change
  This uses the type casting (number to string) and string concatenation
  operator (`||`, double pipes) that's essentially a `+` for strings.
*/

/*
 3. What is the average duration of a trip for 2019?
*/

SELECT AVG(duration)
    FROM indego_trips_2019_q2

  
/*
 4. What is the average duration of a trip for 2020?
*/

SELECT AVG(duration)
    FROM indego_trips_2020_q2


/*
  5. What is the longest duration trip?
*/

WITH trip_duration AS (
    SELECT trip_id, duration, start_time::date
    FROM indego_trips_2019_q2
    UNION All
    SELECT trip_id, duration, start_time::date
    FROM indego_trips_2020_q2)

SELECT MAX(duration)
    FROM trip_duration


/*
 6. How many trips were shorter than 10 minutes?
*/

WITH trip_duration_u_19_20 AS (
    SELECT trip_id, duration
    FROM indego_trips_2019_q2
    UNION All
    SELECT trip_id, duration
    FROM indego_trips_2020_q2)

SELECT COUNT(duration)
    FROM trip_duration_u_19_20
    WHERE duration < 10


/*
 7. How many trips started on one day and ended in the next?
*/

WITH trip_start_time_u_19_20 AS (
    SELECT trip_id, 
        DATE_PART('day',start_time::date) AS start_day, 
        DATE_PART('day',end_time::date) AS end_day
    FROM indego_trips_2019_q2
    UNION ALL
    SELECT trip_id,
        DATE_PART('day',start_time::date) AS start_day, 
        DATE_PART('day',end_time::date) AS end_day 
    FROM indego_trips_2020_q2)

SELECT COUNT(*) 
    FROM trip_start_time_u_19_20
    WHERE start_day != end_day


/*
 8. Give the five most popular starting stations between 7am and 10am in 2019.
*/

WITH counts2019 AS (
  SELECT start_station, COUNT(*) as numbertrips
  FROM indego_trips_2019_q2
  GROUP BY start_station
)

SELECT b.station_id, b.station_name, a.numbertrips
    FROM counts2019 a
    INNER JOIN station_status b
    ON a.start_station = b.station_id
    ORDER BY numbertrips DESC
    LIMIT 5


/*
 9. List all the passholder types and number of trips for each.
  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

WITH pass_type AS (
  SELECT trip_id, passholder_type
  FROM indego_trips_2019_q2
  UNION
  SELECT trip_id, passholder_type
  FROM indego_trips_2020_q2
)

SELECT passholder_type, COUNT(*) AS numbertrips
  FROM pass_type
  GROUP BY passholder_type


/*
 10. Using the station status dataset, find the distance in meters of all stations
  from Meyerson Hall.
*/

SELECT st_distance(
    ST_Transform(st_setsrid(st_point(-75.19264,39.95222),4326), 3857),
    ST_Transform(the_geom, 3857)
) distance_m_Meyerson, id station_id, name station_name
FROM indego_station_statuses


/*
 11. What is the average distance (in meters) of all stations from Meyerson Hall?
*/

SELECT AVG(
  st_distance(ST_Transform(st_setsrid(st_point(-75.19264,39.95222), 4326), 3857),
              ST_Transform(the_geom, 3857))
              ) as avg_dist_m
        FROM indego_station_statuses

/*
 12. How many stations are within 1km of Meyerson Hall?
*/

WITH distance_m_Meyerson AS ( 
  SELECT ST_Distance(ST_Transform(the_geom::geometry, 3857),
					 ST_Transform('SRID=4326; POINT( -75.19245084288279 39.952469494960795)'::geometry, 3857)
                     ) AS dist_m
  FROM indego_station_statuses
)

SELECT COUNT(*) 
FROM distance_m_Meyerson
WHERE dist_m < 1000 


/*
 13. Which station is furthest from Meyerson Hall?
  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/


WITH distance_m_Meyerson AS (
  SELECT 
  	id station_id, 
  	name station_name,
  	st_distance(
    	ST_Transform(st_setsrid(st_point(-75.19264,39.95222), 4326), 3857),
    	ST_Transform(the_geom, 3857)
  		) AS dist_m
  FROM indego_station_statuses)
  
SELECT * 
FROM distance_m_Meyerson
ORDER BY dist_m DESC
LIMIT 1 

/*
 14. Which station is closest to Meyerson Hall?
  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

WITH distance_m_Meyerson AS (
  SELECT 
  	id station_id, 
  	name station_name,
  	st_distance(
    	ST_Transform(st_setsrid(st_point(-75.19264,39.95222), 4326), 3857),
    	ST_Transform(the_geom, 3857)
  		) AS dist_m
  FROM indego_station_statuses)
  
SELECT * 
FROM distance_m_Meyerson
ORDER BY dist_m 
LIMIT 1  


