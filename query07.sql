/*
  How many trips started on one day and ended in the next?
*/

-- Enter your SQL query here

UPDATE indego_trips_2020_q2
  SET start_time = replace(start_time,'/','.'),
      end_time = replace(end_time,'/','.');

CREATE TABLE datetimes AS (
  SELECT  trip_id
          , extract(day from to_timestamp(start_time, 'DD.MM.YY HH24:MI')) as startday
          , extract(day from to_timestamp(end_time, 'DD.MM.YY HH24:MI')) as endday
          , 2019 as year
    FROM indego_trips_2019_q2
  UNION
  SELECT  trip_id
          , extract(day from to_timestamp(start_time, 'MM.DD.YY HH24:MI')) as startday
          , extract(day from to_timestamp(end_time, 'MM.DD.YY HH24:MI')) as endday
          , 2020 as year
    FROM indego_trips_2020_q2
);

SELECT count(*)
FROM datetimes
WHERE startday != endday and year=2019
;

SELECT count(*)
FROM datetimes
WHERE startday != endday and year=2020
;
