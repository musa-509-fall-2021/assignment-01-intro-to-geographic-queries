/*
  How many trips were shorter than 10 minutes?
*/

-- Enter your SQL query here

select count(*) from durations
where duration <= 10 and year=2019;

select count(*) from durations
where duration <= 10 and year=2020;