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

    ```sql
    select a.cnt_2019,b.cnt_2020,round((b.cnt_2020-a.cnt_2019)/(a.cnt_2019*1.0)*100,2)||'%'as compare
    from
    (SELECT count(*) as cnt_2019
    FROM indego_trips_2019_q2)as a,
    (SELECT count(*) as cnt_2020
    FROM indego_trips_2020_q2)as b
    ```
    **Result:** -9.58%

3. [What is the average duration of a trip for 2019?](query03.sql)

    ```sql
    SELECT AVG(duration)
    FROM indego_trips_2019_q2
    ```

    **Result:** 23.674069802378437



4. [What is the average duration of a trip for 2020?](query04.sql)

    _What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here._

    ```sql
    SELECT AVG (duration)
    FROM indego_trips_2020_q2
    ```

    **Result:** 39.23600913251798

    **Answer:**
    I think it's because under the condition of covid 19,people prefer to ride bike instead of taking public transportation,
    which leads to longer duration of each trip.

5. [What is the longest duration trip?](query05.sql)

    _Why are there so many trips of this duration?_

    ```sql
    select max (a)
    from
    (select max(duration) as a from indego_trips_2020_q2
     union
     select max(duration)as a from indego_trips_2019_q2)as d
    ```
    **Result:** 1440

    **Answer:**
    Because 1440 minutes is also the duration of a whole day, so I guess maybe it's because many people tend to not return the bike so that they can use the bike the other day.or they just forgot to lock the bike after they finish riding. But the bike will automatically lock after 24 hours,which is 1440 minutes.

6. [How many trips were shorter than 10 minutes?](query06.sql)

    ```sql
    select sum(sum1) from(
    select count(*)as sum1
    from indego_trips_2020_q2
    where(duration)<10
    union
    select count(*)as sum1
    from indego_trips_2019_q2
    where(duration)<10
    )as total
    ```

    **Result:**  121687

7. [How many trips started on one day and ended in the next?](query07.sql)


    ```sql
    select sum(sum1) FROM
    (select count(*) as sum1
    from indego_trips_2020_q2
    where to_date(start_time,'MM/DD/YYYY')
    =to_date(end_time,'MM/DD/YYYY')-1
    union all
    select count(*) as sum1
    from indego_trips_2019_q2
    where date(start_time)=date(end_time)-1
    )d
    ```

    **Result:**  4332

    _Hint 1: date strings can be parsed using the text type to datetime type conversion function [`to_timestamp`](https://www.postgresql.org/docs/12/functions-formatting.html). See the section on [Template Patterns for Date/Time Formatting](https://www.postgresql.org/docs/12/functions-formatting.html#FUNCTIONS-FORMATTING-DATETIME-TABLE) for options on choosing the right string format. The 2020 dataset has the timestamp in a slightly unusual format so you need to tell PostgreSQL how to parse it. The 2019 data should already be in a good format._

    _Hint 2: Days of the month can be retrieved from a timestamp using the [EXTRACT](https://www.postgresql.org/docs/12/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT) function. See also some of the follow alongs from the Lecture in week 2._

8. [Give the five most popular starting stations between 7am and 10am in 2019.](query08.sql)

    _Hint: Use the `EXTRACT` function to get the hour of the day from the timestamp._

    ```sql
    select start_station,count(*)
    from indego_trips_2019_q2
    where extract (hour from start_time) between 7 and 10
    group by start_station
    order by 2 desc
    limit 5
    ```

      **Result:**  
    ```sql
      start_station           count
      -----------------------------------
          3102                 1320
      -----------------------------------
          3012                 1125
      -----------------------------------
          3007                 877
      -----------------------------------
          3064                 877
      -----------------------------------
          3100                 807
       ```

9. [List all the passholder types and number of trips for each.](query09.sql)

    ```sql
    select d.a,sum (d.b)
    from
    (select passholder_type as a,count(*) as b
    from indego_trips_2019_q2
    group by passholder_type
    union all
    select passholder_type as a,count(*) as b
    from indego_trips_2020_q2
    group by passholder_type)d
    group by d.a
    ```

       **Result:**  
         ```sql
          a                  sum
    -----------------------------------
        Day Pass            72362
    -----------------------------------
        Indego30            263249
    -----------------------------------
        Indego365           56358
    -----------------------------------
        IndegoFlex          852
    -----------------------------------
        NULL                35
    -----------------------------------
        Walk-up             84
     ```
10. [Using the station status dataset, find the distance in meters of all stations from Meyerson Hall.](query10.sql)
    ```sql
    --***solution first****
    SELECT
       name, st_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326),FALSE)||m
              as distance_from_meyerson
    from indego_bikeshare_data_station_status_data

    --***solution second****
    SELECT
          name, the_geom <-> (st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326),FALSE)
           as distance_from_meyerson
    FROM  indego_bikeshare_data_station_status_data
     ```

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)
    ```sql
    SELECT
    avg( st_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326),FALSE))
          as distance_from_meyerson
     from indego_bikeshare_data_station_status_data
     ```
      **Result:**  2861.9014772768105

12. [How many stations are within 1km of Meyerson Hall?](query12.sql)
    ```sql
    SELECT count(*)
    FROM indego_bikeshare_data_station_status_data   
    WHERE
       st_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326),FALSE) <1000
     ```
**Result:** 14

13. [Which station is furthest from Meyerson Hall?](query13.sql)

   ```sql
   select name
   from indego_bikeshare_data_station_status_data
   order by ST_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326))asc
   limit 1
   ```
**Result:** 34th & Spruce
14. [Which station is closest to Meyerson Hall?](query14.sql)

   ```sql
   select name
   from indego_bikeshare_data_station_status_data
   order by ST_distance(the_geom,st_setsrid(st_makepoint(-75.19263125091902,39.95238429917612),4326))desc
   limit 1
   ```
**Result:**   Thompson & Palmer, Adaire School
