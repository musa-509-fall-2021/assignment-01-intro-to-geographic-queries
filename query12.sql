/*
  How many stations are within 1km of Meyerson Hall?
*/

-- Enter your SQL query here
with meyerson_hall as (
    select 'SRID=4326; POINT(-75.1927385462581  39.95244189189052)'::geometry as the_geom
)

select count(*)
from indego_station_statuses as s
join meyerson_hall as h on true
where st_dwithin(
    st_transform(s.the_geom, 2272),
    st_transform(h.the_geom, 2272),
    3280.84  -- This is the number of ft in a km
)
