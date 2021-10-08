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

    **Result:** There was a 10.59% decrease in trips from Q2 of 2019 to Q2 of 2020

3. [What is the average duration of a trip for 2019?](query03.sql)

    **Result:** 23.67 Minutes

4. [What is the average duration of a trip for 2020?](query04.sql)

    _What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here._

    **Answer:** 39.24 Minutes

5. [What is the longest duration trip?](query05.sql)

    _Why are there so many trips of this duration?_

    **Answer:** 1440 minutes

6. [How many trips were shorter than 10 minutes?](query06.sql)

    **Answer:** 1228 trips in Q2 of 2019 and Q2 of 2020 in total

7. [How many trips started on one day and ended in the next?](query07.sql)

    **Answer:** 1782 trips in Q2 of 2019 and Q2 of 2020 in total

    _Hint 1: date strings can be parsed using the text type to datetime type conversion function [`to_timestamp`](https://www.postgresql.org/docs/12/functions-formatting.html). See the section on [Template Patterns for Date/Time Formatting](https://www.postgresql.org/docs/12/functions-formatting.html#FUNCTIONS-FORMATTING-DATETIME-TABLE) for options on choosing the right string format. The 2020 dataset has the timestamp in a slightly unusual format so you need to tell PostgreSQL how to parse it. The 2019 data should already be in a good format._

    _Hint 2: Days of the month can be retrieved from a timestamp using the [EXTRACT](https://www.postgresql.org/docs/12/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT) function. See also some of the follow alongs from the Lecture in week 2._

8. [Give the five most popular starting stations between 7am and 10am in 2019.](query08.sql)

    **Answer:** 
    1. Pennsylvania & Fairmount Perelman Building - 1280 rides
    2. 21st & Catharine - 1088 rides
    3. 11th & Pine, Kahn Park - 858 rides
    4. 18th & Washington, Chew Playground - 836 rides
    5. Moyamensing & Tasker - 792 rides

    _Hint: Use the `EXTRACT` function to get the hour of the day from the timestamp._

9. [List all the passholder types and number of trips for each.](query09.sql)

    **Answer:** 
    1. Day Pass - 72,362 trips
    2. Indego30 - 263,249 trips
    3. Indego365 - 56,358 trips
    4. IndegoFlex - 852 trips
    5. NULL - 35 trips
    6. Walk-up - 84 trips

10. [Using the station status dataset, find the distance in meters of all stations from Meyerson Hall.](query10.sql)

    **Answer:** (First five)
    1. 34th & Spruce - 263.88 meters
    2. 34th & Chestnut - 323.32 meters
    3. 36th & Samsom - 328.74 meters
    4. 33rd & Market - 600.45 meters
    5. University City Station - 607.94 meters

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)

    **Answer:** 3740.24 meters

12. [How many stations are within 1km of Meyerson Hall?](query12.sql)

    **Answer:** There are 9 stations within 1 km of Meyerson Hall

13. [Which station is furthest from Meyerson Hall?](query13.sql)

    **Answer:** 15th & Kitty Hawk (Station ID: 3183) is 9213.56 meters from Meyerson Hall

14. [Which station is closest to Meyerson Hall?](query14.sql)

    **Answer:** 34th & Spruce (station ID: 3208) is 263.88 meters from Meyerson Hall
