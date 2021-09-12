/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
SELECT passholder_type,count(*)
FROM indego_trips_2019_q2
GROUP BY passholder_type


