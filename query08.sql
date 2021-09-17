/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
select start_station as station, count(start_station) as num
from indego_trips_2019_q2
where extract(hour from end_time)<10 and extract(hour from start_time)>=7
group by start_station
union
select end_station as station, count(end_station) as num
from indego_trips_2019_q2
where extract(hour from end_time)<10 and extract(hour from start_time)>=7
group by end_station
order by num desc
limit 5