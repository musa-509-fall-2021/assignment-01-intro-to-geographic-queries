/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
  
Day Pass -38165

Indego30 - 129905

Indego365 - 18515

IndegoFlex - 1

*/

-- Enter your SQL query here
select ...
SELECT 
  passholder_type,
  COUNT (passholder_type)
FROM 
  indego_trips_2020_q2
GROUP BY passholder_type