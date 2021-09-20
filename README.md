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

**Result:** -9.6%

3. [What is the average duration of a trip for 2019?](query03.sql)

 **Result:** 23.67

4. [What is the average duration of a trip for 2020?](query04.sql)

 **Result:** 39.24

    _What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here._

    
**Answer:** Two possible changes from 2019 to 2020 could conceivably have contributed to the substantial increase in average trip duration between those two years. First, although data is needed to verify this, it is possible that new infrastructure was put into place, such as new bike lanes and stations, enabling people living in areas previously out of reach from the main cluster of indego stations to utilize the service. Increased service to such areas would logically have led to an increase in average duration, as such riders have to traverse greater distances being located at the outer margins of the city. Second, the onset of the coronavirus pandemic brought about seismic changes in people's everyday lives and routines, so naturally that may have played an outsized role in the increase, as well. Specifically, in response to the government lockdowns and the dangers of socializing indoors, many found new respite in outdoor activities, one of which could very well have been cycling. Moreover, with the immediate widespread adoption of remote work, Indego bikes likely were less used for short commuting but more for longer, recreational travel.

5. [What is the longest duration trip?](query05.sql)

**Result:** 1440

    _Why are there so many trips of this duration?_

    **Answer:**

6. [How many trips were shorter than 10 minutes?](query06.sql)

**Result:** 46729

7. [How many trips started on one day and ended in the next?](query07.sql)

    _Hint 1: date strings can be parsed using the text type to datetime type conversion function [`to_timestamp`](https://www.postgresql.org/docs/12/functions-formatting.html). See the section on [Template Patterns for Date/Time Formatting](https://www.postgresql.org/docs/12/functions-formatting.html#FUNCTIONS-FORMATTING-DATETIME-TABLE) for options on choosing the right string format. The 2020 dataset has the timestamp in a slightly unusual format so you need to tell PostgreSQL how to parse it. The 2019 data should already be in a good format._

    _Hint 2: Days of the month can be retrieved from a timestamp using the [EXTRACT](https://www.postgresql.org/docs/12/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT) function. See also some of the follow alongs from the Lecture in week 2._
    
**Result:** 1,600 trips (2019); 2,557 trips (2020)

8. [Give the five most popular starting stations between 7am and 10am in 2019.](query08.sql)

    _Hint: Use the `EXTRACT` function to get the hour of the day from the timestamp._

**Result:** 3102, 3012, 3064, 3007, 3066

9. [List all the passholder types and number of trips for each.](query09.sql)

**Result:** Day Pass, 34197; Indego30, 133344; Indego365, 37843; IndegoFlex, 851; NULL, 35; Walk-Up, 84

10. [Using the station status dataset, find the distance in meters of all stations from Meyerson Hall.](query10.sql)

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)

**Result:** 3741 meters

12. [How many stations are within 1km of Meyerson Hall?](query12.sql)

**Result:** 9 stations

13. [Which station is furthest from Meyerson Hall?](query13.sql)

**Result:** Thompson & Palmer

14. [Which station is closest to Meyerson Hall?](query14.sql)

**Result:** 34th and Spruce
