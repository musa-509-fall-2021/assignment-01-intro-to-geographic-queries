/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
select passholder_type, count(*) from 
(select trip_id, passholder_type
from indego_trips_2019_q2
union
select trip_id, passholder_type
from indego_trips_2020_q2) as total
group by passholder_type

/*
The query result:
Indego30 	263249
NULL 		35
Indego365 	56358
IndegoFlex 	852
Walk-up 	84
Day Pass 	72362
*/
