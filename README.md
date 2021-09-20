# Assignment 1

**Due: Sept 19, 2021 by 11:59pm ET**

## Datasets

* Indego Bikeshare data station status data
* Indego Trip data
  - Q2 2020
  - Q2 2019

All data is available from [Indego's Data site](https://www.rideindego.com/about/data/).

Load all three datasets into your CARTO account.

Fork this repository and fill in each of the SQL files corresponding to the questions below. Submit a pull request back to the original repository with your answers.

1. [How many bike trips in Q2 2019?](query01.sql)

    This file is filled out for you, as an example.

    ```SQL
    SELECT count(*)
    FROM indego_trips_2019_q2
    ```

    **Result:** 206354

2. [What is the percent change in trips in Q2 2020 as compared to Q2 2019?](query02.sql)
    _Bonus: If you want to get fancier here, you can cast the result to a string and concatenate a `'%'` to the end. For example, `(10 + 3.2)::text || '%' AS perc_change`. This uses the type casting (number to string) and string concatenation operator (`||`, double pipes) that's essentially a `+` for strings._
    ```SQL
    SELECT count(*)
    FROM indego_trips_2019_q2
    ```
    Returned with 186586, then:
    ```SQL
    SELECT  
    100.0*(186586 - 206354) / 206354 As PercentDiff
    ```
    Returned with the value -9.579654380336702, which is -9.58%
    
3. [What is the average duration of a trip for 2019?](query03.sql)
   ```SQL
   SELECT AVG(DURATION)
   FROM indego_trips_2019_q2
   ```
   returned with 23.67 (mins)
   
4. [What is the average duration of a trip for 2020?](query04.sql)

    _What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here._
    ```SQL
    SELECT AVG(DURATION)
    FROM indego_trips_2020_q2
    ```
    **Answer:** 39.24 (mins)

5. [What is the longest duration trip?](query05.sql)

    _Why are there so many trips of this duration?_
    ```SQL
    SELECT MAX(DURATION)
    FROM indego_trips_2019_q2
    ```
    **Answer:** 1440 mins = 24 hours

6. [How many trips were shorter than 10 minutes?](query06.sql)
   ```SQL
   SELECT count(duration)
   from indego_trips_2020_q2
   where duration < 10
   ```
   **Answer:** 46729
   
7. [How many trips started on one day and ended in the next?](query07.sql)

   ```SQL
   SELECT COUNT(extract(day from end_time::timestamp - start_time::timestamp))
   FROM indego_trips_2019_q2
   WHERE extract(day from end_time::timestamp - start_time::timestamp)=1
   ```
   **Answer:** 118

8. [Give the five most popular starting stations between 7am and 10am in 2019.](query08.sql)

    ```SQL
    SELECT start_station,
    COUNT(*)
    FROM  indego_trips_2019_q2
    WHERE TRIM(to_char(start_time, 'HH24')) LIKE '07' or 
       TRIM(to_char(start_time, 'HH24')) LIKE '08' or 
       TRIM(to_char(start_time, 'HH24')) LIKE '09'
    GROUP BY start_station
    ```
    when order by DESC, returned with start_statio(s) of 3102, 3012, 3007, 3064, 3100

9. [List all the passholder types and number of trips for each.](query09.sql)
    ```SQL
    SELECT passholder_type,
    COUNT(*)
    FROM  indego_trips_2019_q2
    GROUP BY passholder_type
    ```
    passholder_type	count
    Indego365	37843
    Indego30	133344
    Walk-up	84
    IndegoFlex	851
    Day Pass	34197
    NULL	35
10. [Using the station status dataset, find the distance in meters of all stations from Meyerson Hall.](query10.sql)
   ```SQL
   select st_distance(
   st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
   st_transform(the_geom, 3857)) 
   distance_from_Meyerson, id station_id, name station_name
   from indego_station_statuses
   ```

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)
   ```SQL
   select avg(st_distance(
     st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
     st_transform(the_geom, 3857)))
     from indego_station_statuses
   ```
   Returned with 3733.772662085372.
    
12. [How many stations are within 1km of Meyerson Hall?](query12.sql)
   ```SQL
   with distance_table as(
    select st_distance(
    st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
    st_transform(the_geom, 3857)) distance
    from indego_station_statuses)
   select count(distance) from distance_table
    where distance <= 1000
   ``` 
    **Answer:** 8

13. [Which station is furthest from Meyerson Hall?](query13.sql)
   ```SQL
   select name station_name, id station_id, st_distance(
    st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
    st_transform(the_geom, 3857)) distance_from_Meyerson
    from indego_station_statuses
    order by distance_from_Meyerson DESC
  ```
  **Answer:** station_name: 15th & Kitty Hawk; station_id: 3183; distance_from_meyerson: 9221.052730085898.

14. [Which station is closest to Meyerson Hall?](query14.sql)
   ```SQL
   select name station_name, id station_id, st_distance(
    st_transform(st_setsrid(st_point(-75.1926,39.9523),4326),3857),
    st_transform(the_geom, 3857)) distance_from_Meyerson
    from indego_station_statuses
    order by distance_from_Meyerson ASC
   ```
   **Answer:** 34th & Spruce (station_id:3208; distance_from_meyerson: 273.72368554731594 meters)

