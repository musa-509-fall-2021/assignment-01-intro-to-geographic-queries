/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here

with passes AS (
  SELECT trip_id, passholder_type
  FROM indego_trips_2019_q2
  UNION
  SELECT trip_id, passholder_type
  FROM indego_trips_2020_q2
)

SELECT passholder_type, count(*) as ntrips
  FROM passes
  GROUP BY passholder_type
;