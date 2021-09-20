/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
select a.passholder_type, a.amount_2019, b.amount_2020
from (
  select passholder_type, count(*) as amount_2019
  from indego_trips_2019_q2 
  group by passholder_type
) as a
left join(
  select passholder_type, count(*) as amount_2020
  from indego_trips_2020_q2 
  group by passholder_type
) as b
on a.passholder_type = b.passholder_type 

