/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here

SELECT  passholder_type, SUM(count) times
FROM (
    SELECT  passholder_type, COUNT(*) 
	FROM (
        SELECT * from indego_trips_2019_q2 
        union ALL
        SELECT * from indego_trips_2020_q2 
    ) all_data
	GROUP BY  passholder_type
) passholder_table
GROUP BY  passholder_type