/*
  What is the percent change in trips in Q2 2020 as compared to Q2 2019?

  Using only the table from Q2 2020 and the number calculated in the previous
  question, find the percent change of number of trips in Q2 2020 as compared
  to 2019. Remember you can do calculations in the select clause.
 Answer - -9.58%

-- Enter your SQL query here

select a.cnt_2019,b.cnt_2020,round((b.cnt_2020-a.cnt_2019)/(a.cnt_2019*1.0)*100,2)||'%'as compare
from
(SELECT count(*) as cnt_2019
FROM indego_trips_2019_q2)as a,
(SELECT count(*) as cnt_2020
FROM indego_trips_2020_q2)as b

/*
  Bonus: If you want to get fancier here, you can cast the result to a string
  and concatenate a '%' to the end. For example:

      (10 + 3.2)::text || '%' AS perc_change

  This uses the type casting (number to string) and string concatenation
  operator (`||`, double pipes) that's essentially a `+` for strings.
*/
