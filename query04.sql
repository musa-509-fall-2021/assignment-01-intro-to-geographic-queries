/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here
select avg(duration) as average_duration
from indego_trips_2020_q2

/*
What do you notice about the difference in trip lengths? 
Give a few explanations for why there could be a difference here.

Answer:

The average duration of trips in 2020 is significantly longer than that in 2019.
Possible explanations might due to the COVID, more people choose to ride a bike rather than 
take public transportations, even if it is a long travel.

*/