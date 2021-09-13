/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here

with all_data as(
  SELECT * from indego_trips_2019_q2 
  union ALL
  SELECT * from indego_trips_2020_q2 
), passholder_table as (
  SELECT  passholder_type, COUNT(*) 
  FROM  all_data
  GROUP BY  passholder_type
)
SELECT passholder_type, SUM(count) times
FROM passholder_table
GROUP BY  passholder_type