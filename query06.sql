/*
  How many trips were shorter than 10 minutes?
*/

-- For 2020:
SELECT COUNT(*)
FROM public.indego_trips_2020_q2
WHERE duration < 10

-- For 2019:
SELECT COUNT(*)
FROM public.indego_trips_2019_q2
WHERE duration < 10
