/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here

select * from distances
where meyerson_dist <= 1000;
