/*
  What is the percent change in trips in Q2 2020 as compared to Q2 2019?

  Using only the table from Q2 2020 and the number calculated in the previous
  question, find the percent change of number of trips in Q2 2020 as compared
  to 2019. Remember you can do calculations in the select clause.
*/

-- Enter your SQL query here

WITH 
    trips_2020Q2 as (
        SELECT * FROM public.indego_trips_2021_q2
    ),
    trips_2019Q2 as (
    	 SELECT * FROM public.indego_trips_2019_q2
    ),
    count_2020Q2 AS (SELECT COUNT(*) FROM trips_2020Q2),
    count_2019Q2 AS (SELECT COUNT(*) FROM trips_2019Q2)
SELECT to_char(
    (count_2020Q2.count - count_2019Q2.count)/count_2020Q2.count::float8, '99999.00%'
  )
  AS perc_change
FROM count_2020Q2, count_2019Q2

/*
  Bonus: If you want to get fancier here, you can cast the result to a string
  and concatenate a '%' to the end. For example:

      (10 + 3.2)::text || '%' AS perc_change

  This uses the type casting (number to string) and string concatenation
  operator (`||`, double pipes) that's essentially a `+` for strings.
*/
