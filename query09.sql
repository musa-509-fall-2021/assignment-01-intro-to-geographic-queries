/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
SELECT passholder_type,
  COUNT(*)
  FROM  indego_trips_2019_q2
  GROUP BY passholder_type
  
 SELECT passholder_type,
  COUNT(*)
  FROM  indego_trips_2020_q2
  GROUP BY passholder_type
/*
passholder_type	count (2019Q2)
Indego365	37843
Indego30	133344
Walk-up	84
IndegoFlex	851
Day Pass	34197
NULL	35

passholder_type count (2020Q2)
Day Pass 38165
Indego30 129905
Indego365 18515
IndegoFlex 1
*/
