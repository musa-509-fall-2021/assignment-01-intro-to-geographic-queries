/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here
SELECT AVG(DURATION)
 FROM indego_trips_2020_q2

-- Returned with 39.24 (mins)

/*
What do you notice about the difference in trip lengths? Give a few explanations for why there could be a difference here.

Answer: I think it is due to the COVID-19 pandemic which makes 1) transit authority reduce its serviceses and 2) travelers feel safer to bike without squeezing in a closed spaces.
Thus people tend to bike to far places where they used to ride transit to during the 2020 Q2.
*/
