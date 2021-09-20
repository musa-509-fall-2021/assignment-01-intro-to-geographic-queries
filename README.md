# Assignment 1

**Due: Sept 14, 2021 by 11:59pm ET**

## Datasets

* Indego Bikeshare data station status data
* Indego Trip data
  - Q2 2020
  - Q2 2019

All data is available from [Indego's Data site](https://www.rideindego.com/about/data/).

Load all three datasets into your CARTO account.

Fork this repository and fill in each of the SQL files corresponding to the questions below. Submit a pull request back to the original repository with your answers.

1. [How many bike trips in Q2 2019?](query01.sql)

    ```SQL
    select count(*)
    from indego_trips_2019_q2;
    ```
    **Result:** 206354

2. [What is the percent change in trips in Q2 2020 as compared to Q2 2019?](query02.sql)
    _Bonus: If you want to get fancier here, you can cast the result to a string and concatenate a `'%'` to the end. For example, `(10 + 3.2)::text || '%' AS perc_change`. This uses the type casting (number to string) and string concatenation operator (`||`, double pipes) that's essentially a `+` for strings._

    ```SQL
    WITH 
        trips_2020Q2 as (
            SELECT * FROM indego_trips_2020_q2
            )
    SELECT to_char(
        (count(*) - 206354)/206354::float8 * 100, '99999.00%')
    AS perc_change
    FROM trips_2020Q2
    ```
    **Result:** Percent change in trips from 2019Q2 to 2020Q2 is -9.58%

3. [What is the average duration of a trip for 2019?](query03.sql)

    ```SQL
    WITH 
        full_time as (
            SELECT 
            CAST(EXTRACT(EPOCH FROM (end_time - start_time)) AS int) AS time_difference
            FROM indego_trips_2019_q2
        )
    SELECT 
        AVG(time_difference)/60 as avg_minutes_per_trip
    FROM full_time
    WHERE time_difference IS NOT NULL
    ```
    **Result:** Average Duration of 24.696 Minutes per trip in 2019 Q2

4. [What is the average duration of a trip for 2020?](query04.sql)

    ```SQL
    WITH 
        full_time as (
            SELECT 
        CAST(EXTRACT(EPOCH FROM end_time - start_time) AS int) AS seconds_difference
            FROM public.indego_trips_2020_q2
        )
    SELECT 
        CAST(AVG(seconds_difference)/60 AS decimal) as avg_minutes_per_trip
    FROM full_time
    WHERE seconds_difference IS NOT NULL
    ```
    **Result:** Average Duration of 49.781 Minutes per trip in 2020 Q2

    _What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here._

    **Answer:** Bikeshare users have a variety of reasons to use the bike in Philly, resulting in stark differences in trip length and destinations. Commuters might only need to use the bike from Point A to B, resulting in a 30 minute trip for only one day. A tourist may have a variety of destinations and might not be familiar with the Indego stations, resulting in them borrrowing the bike for their entire stay of a few days. 

5. [What is the longest duration trip?](query05.sql)

    ```SQL
    WITH 
    full_time as (
        SELECT 
        EXTRACT(EPOCH FROM end_time - start_time)::int AS seconds_difference
        FROM public.indego_trips_2020_q2
    )
    SELECT 
        MAX(seconds_difference)/86400::FLOAT || ' Days' as longest_trip
    FROM full_time
    WHERE seconds_difference IS NOT NULL
    ```
    **Result:** For Q2 2020, the longest trip was 29.8 Days

    _Why are there so many trips of this duration?_

    **Answer:** Since the longest trip length is almost a month, the Indego platform might remotely end the trip of lost/stolen bikes after a month's time. Another possibility is Indego could have users with unlimited monthly passes, causing users to end their extended ride before their next pay period.

6. [How many trips were shorter than 10 minutes?](query06.sql)

    ```SQL
    WITH 
    full_time as (
        SELECT 
        EXTRACT(EPOCH FROM end_time - start_time)::int AS seconds_difference
        FROM public.indego_trips_2020_q2
    )
    SELECT 
        COUNT(seconds_difference) as trips_below_10_mins
    FROM full_time
    WHERE seconds_difference < 60*10
    ```
    **Result:** For Q2 2020, 46,786 trips were below 10 minutes

7. [How many trips started on one day and ended in the next?](query07.sql)

    ```SQL
    SELECT 
    COUNT(*) as trips_ending_the_next_day
    FROM public.indego_trips_2020_q2
    WHERE EXTRACT(DOY FROM (start_time)) + 1 = EXTRACT(DOY FROM (end_time))
    ```
    **Result:** For Q2 2020, 2,648 trips started and ended on the next day

8. [Give the five most popular stations between 7am and 10am in 2019.](query08.sql)

    ```SQL
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
    ```
    **Result:** See table below for 2019 top stations used (includes both end & start but not double-counted)
    | station | station_uses |
    |:-------:|:------------:|
    | 3021    |        1,696 |
    | 3102    |        1,369 |
    | 3195    |        1,366 |
    | 3010    |        1,365 |
    | 3020    |        1,300 |

9. [List all the passholder types and number of trips for each.](query09.sql)

    ```SQL
    SELECT
    passholder_type,
    COUNT(*) as trips
    FROM public.indego_trips_2020_q2
    GROUP BY passholder_type
    ```
    **Result:** For 2020: Day Pass (38,165 trips), Indego30 (12,9905 trips), Indego365 (18,515 trip), IndegoFlex (1 trip)

10. [Using the station status dataset, find the distance in meters of all stations from Meyerson Hall.](query10.sql)

    ```SQL
    WITH station_statuses AS (
        SELECT
        *,
        ST_Distance(
            ST_setsrid(ST_MakePoint(39.952296926596986, -75.19268734458572),4326),
            ST_MakePoint(latitude, longitude),
            FALSE
            ) AS meyerson_distance
        FROM public.lr_rt1mwwjuex9ienf202w AS station_status_file
    )
    SELECT 
        meyerson_distance
    FROM station_statuses
    ```
    **Result:** It's a column

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)

    ```SQL
    WITH station_statuses AS (
        SELECT
        *,
        ST_Distance(
            ST_setsrid(ST_MakePoint(39.952296926596986, -75.19268734458572),4326),
            ST_MakePoint(latitude, longitude),
            FALSE
            ) AS meyerson_distance
        FROM public.lr_rt1mwwjuex9ienf202w
    )
    SELECT 
        AVG(meyerson_distance) AS avg_dist_to_meyerson
    FROM station_statuses
    ```
    **Result:** Average of 2902.012 meters from all stations to meyerson

12. [How many stations are within 1km of Meyerson Hall?](query12.sql)

    ```SQL
    WITH station_statuses AS (
        SELECT
        *,
        ST_Distance(
            ST_setsrid(ST_MakePoint(39.952296926596986, -75.19268734458572),4326),
            ST_MakePoint(latitude, longitude),
            FALSE
            ) AS meyerson_distance
        FROM public.lr_rt1mwwjuex9ienf202w
    )
    SELECT 
        COUNT(meyerson_distance) AS stations_within_1km
    FROM station_statuses
    WHERE meyerson_distance <= 1000
    ```
    **Result:** 21 stations within 1km of Meyerson

13. [Which station is furthest from Meyerson Hall?](query13.sql)

    ```SQL
    WITH station_statuses AS (
        SELECT
        *,
        ST_Distance(
            ST_setsrid(ST_MakePoint(39.952296926596986, -75.19268734458572),4326),
            ST_MakePoint(latitude, longitude),
            FALSE
            ) AS meyerson_distance
        FROM public.lr_rt1mwwjuex9ienf202w
    ), 
    max_dist AS (
        SELECT 
            MAX(meyerson_distance) as max_distance
        FROM station_statuses
    )
    SELECT
        id as station_id,
        name as station_name,
        meyerson_distance
    FROM station_statuses
    WHERE meyerson_distance = (SELECT max_distance FROM max_dist)
    ```
    **Result:** Furthest station from Meyerson: Station ID 3153, Station Name Thompson & Palmer, Adaire School, & a Meyerson Distance of 7000.08638912 meters

14. [Which station is closest to Meyerson Hall?](query14.sql)

    ```SQL
    WITH station_statuses AS (
        SELECT
        *,
        ST_Distance(
            ST_setsrid(ST_MakePoint(39.952296926596986, -75.19268734458572),4326),
            ST_MakePoint(latitude, longitude),
            FALSE
            ) AS meyerson_distance
        FROM public.lr_rt1mwwjuex9ienf202w
    ), 
    min_dist AS (
        SELECT 
            MIN(meyerson_distance) as min_distance
        FROM station_statuses
    )
    SELECT
        cartodb_id as cartodb_id,
        id as station_id,
        name as station_name,
        meyerson_distance
    FROM station_statuses
    WHERE meyerson_distance = (SELECT min_distance FROM min_dist)
    ```
    **Result:** Closest station to Meyerson: Station ID 3208, Station Name 34th & Spruce, & a Meyerson Distance of 80.26416575 meters
