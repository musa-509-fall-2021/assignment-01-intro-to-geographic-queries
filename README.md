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
    
    **Result:** -10.59%

3. [What is the average duration of a trip for 2019?](query03.sql)
    
    **Result:** 23.67

4. [What is the average duration of a trip for 2020?](query04.sql)
    
    **Result:** 39.24

    _What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here._

    **Answer:** The average duration of a trip for 2020 is 39.23 min, more than the one for 2019, which is 23.67 min. People will have access to further destinations in 2020. It is probably that people relied on rental bikes more because they tried to avoid using traditional public transportation, like bus, subway or Uber during Covid-19. In addition, answer to query 9 shows that the number of trips with Indego30 increased in 2020, especially that Indego365 increased almost two times of the trips in 2019. It presented that Indego bikes played a more and more important role in public transportation in 2020.

5. [What is the longest duration trip?](query05.sql)
     
     **Result:** 1440

    _Why are there so many trips of this duration?_

    **Answer:**  They probably didn't return the bike to station successfully so system identified the bike is still in use for the rest of the day. So this data is biased and should not be included in further duration analytics

6. [How many trips were shorter than 10 minutes?](query06.sql)
    
    **Result:** 121687

7. [How many trips started on one day and ended in the next?](query07.sql)
    
    **Result:**  OVERNIGHT2019-1684; OVERNIGHT2019-2648  

    _Hint 1: date strings can be parsed using the text type to datetime type conversion function [`to_timestamp`](https://www.postgresql.org/docs/12/functions-formatting.html). See the section on [Template Patterns for Date/Time Formatting](https://www.postgresql.org/docs/12/functions-formatting.html#FUNCTIONS-FORMATTING-DATETIME-TABLE) for options on choosing the right string format. The 2020 dataset has the timestamp in a slightly unusual format so you need to tell PostgreSQL how to parse it. The 2019 data should already be in a good format._

    _Hint 2: Days of the month can be retrieved from a timestamp using the [EXTRACT](https://www.postgresql.org/docs/12/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT) function. See also some of the follow alongs from the Lecture in week 2._

8. [Give the five most popular stations between 7am and 10am in 2019.](query08.sql)

    **Result:** 5 most popular start stations are 3102, 3021, 3007, 3064,3100

    _Hint: Use the `EXTRACT` function to get the hour of the day from the timestamp._

9. [List all the passholder types and number of trips for each.](query09.sql)

   **Result:** Please run the code and get the table.

10. [Using the station status dataset, find the distance in meters of all stations from Meyerson Hall.](query10.sql)
   
   **Result:** Please run the code and get the table.

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)

   **Result:** 2867.5

12. [How many stations are within 1km of Meyerson Hall?](query12.sql)  
   **Result:** 14

13. [Which station is furthest from Meyerson Hall?](query13.sql)
   
   **Result:** 3183

14. [Which station is closest to Meyerson Hall?](query14.sql)
  
   **Result:** 3208