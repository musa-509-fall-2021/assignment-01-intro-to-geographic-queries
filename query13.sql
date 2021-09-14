/*
  Which station is furthest from Meyerson Hall?

  Your query should return only one line, and only gives the station id, station
  name, and distance from Meyerson Hall.
*/

-- Enter your SQL query here

select * from distances
order by meyerson_dist DESC
limit 1;