/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here

select s.station_name, count(*)
      filter (where (extract(hour from start_time) >= 7) and
                    (extract(hour from end_time) <= 10)
              ) as tripCount
from indego_trips_2019_q2 t
inner join indego_stations s 
on t.start_station = s.station_id
group by s.station_name
order by tripCount desc
limit 5