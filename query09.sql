/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
select passholder_type, count(*),'2019' as year from public.indego_trips_2019_q2
group by passholder_type
union
select passholder_type, count(*),'2020' as year from public.indego_trips_2020_q2
group by passholder_type

