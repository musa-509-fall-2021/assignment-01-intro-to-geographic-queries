/*
  How many trips started on one day and ended in the next?
*/

-- For 2019Q2
SELECT COUNT(extract(day from end_time::timestamp - start_time::timestamp))
FROM indego_trips_2019_q2
WHERE extract(day from end_time::timestamp - start_time::timestamp)=1

-- Returned with 118
-- For 2020Q2
SELECT COUNT(extract(day from end_time::timestamp - start_time::timestamp))
FROM indego_trips_2020_q2
WHERE extract(day from end_time::timestamp - start_time::timestamp)=1

-- Returned with246
