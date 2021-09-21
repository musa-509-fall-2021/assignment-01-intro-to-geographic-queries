/*
  What is the average distance (in meters) of all stations from Meyerson Hall?
*/

-- Enter your SQL query here
with meyerson_hall as (
    select 'SRID=4326; POINT(-75.1927385462581  39.95244189189052)'::geometry as the_geom
)

select
    avg(st_distance(
        st_transform(s.the_geom, 2272),
        st_transform(h.the_geom, 2272)
    )) * 0.3048 as distance
from indego_station_statuses as s
join meyerson_hall as h on true
