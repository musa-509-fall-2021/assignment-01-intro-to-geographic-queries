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

    This file is filled out for you, as an example.

    ```SQL
    SELECT count(*)
    FROM indego_trips_2019_q2
    ```

    **Result:** 206354

2. [What is the percent change in trips in Q2 2020 as compared to Q2 2019?](query02.sql)
    _Bonus: If you want to get fancier here, you can cast the result to a string and concatenate a `'%'` to the end. For example, `(10 + 3.2)::text || '%' AS perc_change`. This uses the type casting (number to string) and string concatenation operator (`||`, double pipes) that's essentially a `+` for strings._

3. [What is the average duration of a trip for 2019?](query03.sql)

4. [What is the average duration of a trip for 2020?](query04.sql)

    _What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here._

    **Answer:**
    The average duration is 16 minutes longer in 2020 than it was in 2019.  This could be due to ______

5. [What is the longest duration trip?](query05.sql)

    _Why are there so many trips of this duration?_

    **Answer:**
    There are 1440 minutes in a day.  From looking at some of the values in the start_time and end_time columns it is clear that any ride that lasted longer than a full day is considered 1440 minutes.  Therefore there are many rides with a duration of 1440 because the duration maxes out at that number.

6. [How many trips were shorter than 10 minutes?](query06.sql)

7. [How many trips started on one day and ended in the next?](query07.sql)

    _Hint 1: date strings can be parsed using the text type to datetime type conversion function [`to_timestamp`](https://www.postgresql.org/docs/12/functions-formatting.html). See the section on [Template Patterns for Date/Time Formatting](https://www.postgresql.org/docs/12/functions-formatting.html#FUNCTIONS-FORMATTING-DATETIME-TABLE) for options on choosing the right string format. The 2020 dataset has the timestamp in a slightly unusual format so you need to tell PostgreSQL how to parse it. The 2019 data should already be in a good format._

    _Hint 2: Days of the month can be retrieved from a timestamp using the [EXTRACT](https://www.postgresql.org/docs/12/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT) function. See also some of the follow alongs from the Lecture in week 2._

8. [Give the five most popular stations between 7am and 10am in 2019.](query08.sql)

    _Hint: Use the `EXTRACT` function to get the hour of the day from the timestamp._

9. [List all the passholder types and number of trips for each.](query09.sql)

10. [Using the station status dataset, find the distance in meters of all stations from Meyerson Hall.](query10.sql)

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)

12. [How many stations are within 1km of Meyerson Hall?](query12.sql)

13. [Which station is furthest from Meyerson Hall?](query13.sql)

14. [Which station is closest to Meyerson Hall?](query14.sql)
