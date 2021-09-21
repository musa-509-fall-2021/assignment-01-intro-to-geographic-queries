/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
WITH new_table AS(
 SELECT type, count
FROM(
  SELECT passholder_type AS type, COUNT(passholder_type) AS count
FROM indego_trips_2019_q2
GROUP BY passholder_type
  UNION
  SELECT passholder_type AS type, COUNT(passholder_type) AS count
FROM indego_trips_2020_q2
GROUP BY passholder_type
  ) AS Q9)
SELECT type AS type_1, SUM(count) as count_1 
FROM new_table
GROUP BY type

/*
Answer:
In total, it is:
Day Pass: 72362
Indego30: 263249
Indego365: 56358
IndegoFlex: 852
NULL: 35
Walk-up: 84

For year 2019, it is:
Day Pass: 34197
Indego30: 133344
Indego365: 37843
IndegoFlex: 851
NULL: 35
Walk-up: 84

For year 2020, it is:
Day Pass: 38165
Indego30: 129905
Indego365: 18515
IndegoFlex: 1
*/
