/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
SELECT start_year, passholder_type, ride_count FROM
  (SELECT passholder_type, COUNT(passholder_type) AS ride_count, DATE_PART('y',start_time::date) AS start_year
  FROM indego_trips_2019_q2
  GROUP BY passholder_type, start_year
  UNION ALL
  SELECT passholder_type, COUNT(passholder_type) AS ride_count, DATE_PART('y',start_time::date) AS start_year
  FROM indego_trips_2020_q2
  GROUP BY passholder_type, start_year) AS u