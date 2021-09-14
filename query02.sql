/*
  What is the percent change in trips in Q2 2020 as compared to Q2 2019?

  Using only the table from Q2 2020 and the number calculated in the previous
  question, find the percent change of number of trips in Q2 2020 as compared
  to 2019. Remember you can do calculations in the select clause.
*/

-- Enter your SQL query here

with c19 as (
  select 1 as n, count(*) as n2019
  from indego_trips_2019_q2
) , c20 as (
  select 1 as n, count(*) as n2020
  from indego_trips_2020_q2
)
select n2019, n2020, ((n2020::float-n2019::float)/n2020*100)::decimal(4,2)::text || '%' as pctchg
from c19
INNER JOIN c20
on c19.n=c20.n

/*
  Bonus: If you want to get fancier here, you can cast the result to a string
  and concatenate a '%' to the end. For example:

      (10 + 3.2)::text || '%' AS perc_change

  This uses the type casting (number to string) and string concatenation
  operator (`||`, double pipes) that's essentially a `+` for strings.
*/
