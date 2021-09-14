CREATE TABLE indego_trips_2019_q2 (
    trip_id INTEGER PRIMARY KEY,
    duration INTEGER,
    start_time VARCHAR(17),
    end_time VARCHAR(17),
    start_station INTEGER,
    start_lat NUMERIC,
    start_lon NUMERIC,
    end_station INTEGER,
    end_lat NUMERIC,
    end_lon NUMERIC,
    bike_id INTEGER,
    plan_duration INTEGER,
    trip_route_category VARCHAR(20),
    passholder_type VARCHAR(20),
    bike_type VARCHAR(20)
);

COPY indego_trips_2019_q2 FROM '/Users/bensh/Documents/musa509/indego-trips-2019-q2.csv' CSV HEADER DELIMITER ',';

CREATE TABLE indego_trips_2020_q2 (
    trip_id INTEGER PRIMARY KEY,
    duration INTEGER,
    start_time VARCHAR(17),
    end_time VARCHAR(17),
    start_station INTEGER,
    start_lat NUMERIC,
    start_lon NUMERIC,
    end_station INTEGER,
    end_lat NUMERIC,
    end_lon NUMERIC,
    bike_id INTEGER,
    plan_duration INTEGER,
    trip_route_category VARCHAR(20),
    passholder_type VARCHAR(20),
    bike_type VARCHAR(20)
);

COPY indego_trips_2020_q2 FROM '/Users/bensh/Documents/musa509/indego-trips-2020-q2.csv' CSV HEADER DELIMITER ',';

CREATE TABLE station_status (
    the_geom TEXT,
    cartodb_id INTEGER,
    id numeric PRIMARY KEY,
    name TEXT,
    coordinates VARCHAR(25),
    totaldocks INTEGER,
    docksavailable INTEGER,
    bikesavailable INTEGER,
    classicbikesavailable INTEGER,
    smartbikesavailable INTEGER,
    electricbikesavailable INTEGER,
    rewardbikesavailable INTEGER,
    rewarddocksavailable INTEGER,
    kioskstatus TEXT,
    kioskpublicstatus TEXT,
    kioskconnectionstatus TEXT,
    kiosktype INTEGER,
    addressstreet TEXT,
    addresscity TEXT,
    addressstate TEXT,
    addresszipcode TEXT,
    bikes TEXT,
    closetime TEXT,
    eventend TEXT,
    eventstart TEXT,
    iseventbased TEXT,
    isvirtual TEXT,
    kioskid INTEGER,
    notes TEXT,
    opentime TEXT,
    publictext TEXT,
    timezone TEXT,
    trikesavailable INTEGER,
    latitude NUMERIC,
    longitude NUMERIC
);

COPY station_status FROM '/Users/bensh/Documents/musa509/station_status.csv' CSV HEADER DELIMITER ',';
