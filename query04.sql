/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here
select avg(duration) as avg_duration_2020
FROM indego_trips_2020_q2

/*What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here.
Answer:
The trip lengths increases by 65% from 2019 to 2020. 
A huge increase (266%) of the amount of electric bikes may be one of the main reasons.

code to explain the difference - amount of end station

select count(*) as electric_2019, 
(
  select count(*) as electric_2020
  from indego_trips_2020_q2
  where bike_type = 'electric'
)
from indego_trips_2019_q2
where bike_type = 'electric'
*/