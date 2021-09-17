/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here

select count(*) from distances
where meyerson_dist <= 1000;
