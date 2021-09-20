/*
  List all the passholder types and number of trips for each.

  In other words, in one query, give a list of all `passholder_type` options
  and the number of trips taken by `passholder_type`.
*/

SELECT
  passholder_type,
  COUNT(*) as trips
FROM public.indego_trips_2020_q2
GROUP BY passholder_type

-- Answer: Day Pass (38,165 trips), Indego30 (12,9905 trips), Indego365 (18,515 trip), IndegoFlex (1 trip)