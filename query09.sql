/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
SELECT a.passholder_type, a.num_trips1, b.num_trips2
FROM(
  SELECT passholder_type, COUNT (*) AS num_trips1 FROM indego_trips_2020_q2 
  GROUP BY passholder_type) AS a
LEFT JOIN (
  SELECT passholder_type, COUNT (*) AS num_trips2 FROM indego_trips_2019_q2 GROUP BY passholder_type) AS b 
ON a.passholder_type = b.passholder_type