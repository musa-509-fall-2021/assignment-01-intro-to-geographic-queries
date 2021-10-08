-- Johnathan Clementi --
-- MUSA 509 Geospatial Cloud Computing & Vizualization --
-- HW #1 2021-09-19 --
-- Query #2 --

/*
  What is the percent change in trips in Q2 2020 as compared to Q2 2019?

  Using only the table from Q2 2020 and the number calculated in the previous
  question, find the percent change of number of trips in Q2 2020 as compared
  to 2019. Remember you can do calculations in the select clause.
*/

-- Enter your SQL query here
with q2_19 as (
  select count (*) as count19
  from indego_trips_2019_q2
), q2_20 as (
  select count (*) as count20
  from indego_trips_2020_q2
)

select count19, count20, 
    round(((count20::float-count19::float)/count20*100)::numeric,2)::text || '%' as pctChange
from q2_19, q2_20

-- **Result:** There was a 10.59% decrease in trips from Q2 of 2019 to Q2 of 2020

/* 
There were 186586 bike trips in Q2 of 2020
That means there was a 10.59% decrease in ridership between Q2 2020 and Q2 2019.
 */



/*
  Bonus: If you want to get fancier here, you can cast the result to a string
  and concatenate a '%' to the end. For example:

      (10 + 3.2)::text || '%' AS perc_change

  This uses the type casting (number to string) and string concatenation
  operator (`||`, double pipes) that's essentially a `+` for strings.
*/
