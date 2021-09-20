/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

-- Enter your SQL query here
with new_table as (
  select passholder_type2019,
        count_2019,
        coalesce( count_2020,0) as count_2020
  from(select passholder_type as passholder_type2019,
	     count(*) as count_2019
	      from indego_trips_2019_q2
	       group by passholder_type) as a

        left join

        (select passholder_type as passholder_type2020,
          count(*) as count_2020
          from indego_trips_2020_q2 as i
          group by passholder_type) as b
  on a.passholder_type2019=b.passholder_type2020
)

select passholder_type2019 as passholder_type,
      count_2019+count_2020 as num_type
from new_table
