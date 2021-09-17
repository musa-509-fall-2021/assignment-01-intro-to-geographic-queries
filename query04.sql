/*
  What is the average duration of a trip for 2020?
*/

-- Enter your SQL query here
select round(avg(duration), 2) as avg_duration from public.indego_trips_2020_q2

/*
Answer: According to the query results, I found that the average duration in Q2 2019 is 
significantly less than the average duration in 2020. In another search, I found that there 
are 16468 Round Trip records in 2019, and 39164 records in 2020, which is more than double 
the number in 19 years. And in most cases, the Round Trip journey is longer than the One Way 
travel distance, so the average duration in 2020 is higher than in 2019.
*/