```sql
create database farming;
-- add connect statement here
create extension postgis;

-- WATER SOURCE
CREATE TABLE water_source(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	notes TEXT
	uuid TEXT UNIQUE NOT NULL,
);

INSERT INTO water_source(
	name,
	notes,
	uuid	
) values (
	'borehole',
	'A rotary drilled borehole',
	'other'
);

-- WATER POLYGON TYPE
CREATE TABLE water_polygon_type(
	id SERIAL NOT NULL,
	name TEXT NOT NULL,
	uuid TEXT UNIQUE NOT NULL
	
);
-- WATER POLYGON
CREATE TABLE water_polygon(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	notes TEXT
	estimated_depth FLOAT NOT NULL,
	image TEXT,
	geometry GEOMETRY(POLYGON, 4326),
	uuid TEXT NOT NULL  (unique),
	water_source_uuid TEXT UNIQUE NOT NULL REFERENCES water_source(uuid),
	type_uuid TEXT UNIQUE NOT NULL REFERENCES water_polygon_type(uuid)
	
) INHERITS (base_table);

-- WATER POINT TYPE
CREATE TABLE water_point_type (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	notes TEXT NULL,
	uuid TEXT UNIQUE NOT NULL,
);
COMMENT ON TABLE water_point_type IS 
'This is a table to store water points.';


-- WATER POINT 
CREATE TABLE water_point(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	notes TEXT NULL,
	image TEXT,
	geometry GEOMETRY (Point, 4326),
	uuid TEXT UNIQUE NOT NULL,
	water_source_uuid TEXT UNIQUE NOT NULL REFERENCES water_source(uuid),
	water_point_type TEXT UNIQUE NOT NULL REFERENCES water_point_type(uuid)
	
);

-- WATER LINE TYPE
CREATE TABLE water_line_type (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	notes TEXT NULL,
	uuid TEXT UNIQUE NOT NULL,
	pipe_length FLOAT,
	pipe_diameter FLOAT
);
COMMENT ON TABLE water_line_type IS 
'Description of water lines eg. river, irrigaton.';

-- WATER LINE
CREATE TABLE water_line(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	notes TEXT
	estimated_depth FLOAT NOT NULL,
	image TEXT,
	geometry GEOMETRY(POLYGON, 4326),
	uuid TEXT NOT NULL  (unique),
	water_source_uuid TEXT UNIQUE NOT NULL REFERENCES water_source(uuid),
	type_uuid TEXT UNIQUE NOT NULL REFERENCES water_line_type(uuid)

) INHERITS (base_table);

COMMENT ON TABLE water_line IS 'This is the path of the water lines follow.'



