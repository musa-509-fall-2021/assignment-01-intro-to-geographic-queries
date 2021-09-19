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
  
/*
passholder_type	count
Indego365	37843
Indego30	133344
Walk-up	84
IndegoFlex	851
Day Pass	34197
NULL	35
*/
