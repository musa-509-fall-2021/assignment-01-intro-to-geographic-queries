/*
  How many trips were shorter than 10 minutes?

2019: 74,958
2020: 46,729

*/ 
-- Enter your SQL query here
SELECT count(duration) 
FROM public.indego_trips_2019_q2
WHERE duration < 10

SELECT count(duration) 
FROM public.indego_trips_2020_q2
WHERE duration < 10