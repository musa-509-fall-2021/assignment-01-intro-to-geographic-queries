/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here


with first_table as (
  SELECT a.passholder_type as type_1,count(*) as number_2019 
  FROM indego_trips_2019_q2 AS a
  GROUP BY 1)
  ,second_table as (
  SELECT b.passholder_type as type_2,count(*) AS number_2020
  FROM indego_trips_2020_q2 AS b
  GROUP BY 1)
 
select *
from first_table
left join second_table
	on second_table.type_2
    = first_table.type_1

