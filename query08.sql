/*
  Give the five most popular starting stations between 7am and 10am in 2019.
*/

-- Enter your SQL query here
/*
 The first version, the five most popular stations between 7 and 10 
 (including starting and ending stations)

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
*/

/* the five most popular starting stations between 7am and 10am*/
select start_station, count(*) as numbers
from indego_trips_2019_q2
where extract(hour from end_time)<10
and extract(hour from start_time)>=7
group by start_station
order by count(*) desc
limit 5
