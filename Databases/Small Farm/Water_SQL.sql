-- BASE TABLE, STORES uuid, last_update_by and last_update 
CREATE TABLE user_update (
	uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	last_update_by TEXT NOT NULL
);
COMMENT ON TABLE user_update IS 'Stores user information and when data was updated by user.';
COMMENT ON COLUMN user_update.uuid IS 'The unique user ID.';
COMMENT ON COLUMN user_update.last_update IS 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN user_update.last_update_by IS 'The name of the user responsible for the latest update.';


-- WATER SOURCE
CREATE TABLE water_source(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	notes TEXT,
-- 	Constraints are not carried when doing inheritance, as such they should be specified.
	CONSTRAINT water_source_key UNIQUE(uuid) 
) INHERITS(user_update);

COMMENT ON TABLE water_source IS 'Stores information regarding water bodies that provide drinking water.';
COMMENT ON COLUMN water_source.id is 'The unique water source ID. This is the Primary Key.';
COMMENT ON COLUMN water_source.name is 'The water source name, e.g. river, lake, ground water.';
COMMENT ON COLUMN water_source.notes is 'Any additional notes on the water source.';


-- WATER POLYGON TYPE
CREATE TABLE water_polygon_type(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	CONSTRAINT unique_polygon_type_key UNIQUE(uuid)
) INHERITS (user_update);

COMMENT ON TABLE water_polygon_type IS 
'Lookup table of the type of water polygon.';
COMMENT ON COLUMN water_polygon_type.id is 'The unique water polygon ID. Primary Key.';
COMMENT ON COLUMN water_polygon_type.name is 'The water polygon type name, e.g. delta, swamp, reservoir.';


-- WATER POLYGON
CREATE TABLE water_polygon(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	notes TEXT,
	estimated_depth_m FLOAT,
-- 	Estimated depth of water polygon constraint (0m < Estimated Depth < 20m).
	CONSTRAINT depth_check check(
		estimated_depth_m >= 0 and estimated_depth_m <= 20),
	image TEXT,
	geometry GEOMETRY(POLYGON, 4326),
	CONSTRAINT unique_water_polygon_key UNIQUE(uuid),
	water_source_uuid UUID NOT NULL REFERENCES water_source(uuid),
	water_polygon_type_uuid UUID NOT NULL REFERENCES water_polygon_type(uuid)
) INHERITS (user_update);

COMMENT ON TABLE water_polygon IS 'Stores information on land areas that are covered in water, either intermittently or constantly.';
COMMENT ON COLUMN water_polygon.id is 'The unique water polygon ID. Primary Key.';
COMMENT ON COLUMN water_polygon.name is 'The water polygon name, e.g. dam.';
COMMENT ON COLUMN water_polygon.notes is 'Any additional information about the water polygon.';
COMMENT ON COLUMN water_polygon.estimated_depth_m is 'The approximate depth of the water polygon in meters.';
COMMENT ON COLUMN water_polygon.image is 'The link to an image of a water polygon.';
COMMENT ON COLUMN water_polygon.geometry is 'The location of the water polygon. Follows EPSG: 4326.';


-- WATER POINT TYPE
CREATE TABLE water_point_type (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	notes TEXT,
	CONSTRAINT water_point_type_key UNIQUE(uuid)
) INHERITS (user_update);

COMMENT ON TABLE water_point_type is 'This is a lookup table on types of water points.';
COMMENT ON COLUMN water_point_type.id is 'The unique water point type ID. Primary Key.';
COMMENT ON COLUMN water_point_type.name is 'The water point type name, e.g. tap, drinking trough.';
COMMENT ON COLUMN water_point_type.notes is 'Any additional information about the water point type.';


-- WATER POINT 
CREATE TABLE water_point(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	notes TEXT,
	image TEXT,
	geometry GEOMETRY (Point, 4326),
	CONSTRAINT unique_water_point_key UNIQUE(uuid),
	water_source_uuid UUID NOT NULL REFERENCES water_source(uuid),
	water_point_type_uuid UUID NOT NULL REFERENCES water_point_type(uuid)
) INHERITS (user_update);

COMMENT ON TABLE water_point is 'Stores individual locations on places where water is available for use.';
COMMENT ON COLUMN water_point.id is 'The unique water point ID. Primary Key.';
COMMENT ON COLUMN water_point.name is 'The water point name e.g. sink, tap.';
COMMENT ON COLUMN water_point.notes is 'Any additional information about the water point.';
COMMENT ON COLUMN water_point.image is 'The link to an image of a water point.';
COMMENT ON COLUMN water_point.geometry is 'The coordinates of the water point. Follows EPSG: 4326.';



-- WATER LINE TYPE
CREATE TABLE water_line_type (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	notes TEXT,
	pipe_length_m FLOAT,
	pipe_diameter_m FLOAT,
-- 	Pipe length & pipe diameter constraint (length, diameter > 0)
	CONSTRAINT pipe_length_and_diameter_check check(
		pipe_length_m >= 0 and pipe_diameter_m >= 0),
-- 	Unique together
	UNIQUE(pipe_length_m, pipe_diameter_m),
	CONSTRAINT unique_water_line_type_key UNIQUE(uuid)
) INHERITS (user_update);

COMMENT ON TABLE water_line_type IS 'Description of lines through which water flows.';
COMMENT ON COLUMN water_line_type.id is 'The unique water line type ID. Primary Key.';
COMMENT ON COLUMN water_line_type.name is 'The water line type name, e.g. river, irrigaton.';
COMMENT ON COLUMN water_line_type.notes is 'Additional notes on the water line type.';
COMMENT ON COLUMN water_line_type.pipe_length_m is 'The water line length in meters.';
COMMENT ON COLUMN water_line_type.pipe_diameter_m is 'The water line diameter in meters.';


-- WATER LINE
CREATE TABLE water_line(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	notes TEXT,
	estimated_depth_m FLOAT,
-- 	Estimated depth of water line ( depth > 0)
	CONSTRAINT estimated_depth_m check(
		estimated_depth_m >= 0),
	image TEXT,
	geometry GEOMETRY(LINESTRING, 4326),
	CONSTRAINT unique_water_line_key UNIQUE(uuid),
	water_source_uuid UUID NOT NULL REFERENCES water_source(uuid),
	water_line_type_uuid UUID NOT NULL REFERENCES water_line_type(uuid)
) INHERITS (user_update);

COMMENT ON TABLE water_line is 'This is the path the water lines follow.';
COMMENT ON COLUMN water_line.id is 'The unique water line ID. Primary Key.';
COMMENT ON COLUMN water_line.name is 'The unique water line name.';
COMMENT ON COLUMN water_line.notes is 'Any additional information about the water line.';
COMMENT ON COLUMN water_line.estimated_depth_m is 'The approximate depth of the water line in meters.';
COMMENT ON COLUMN water_line.image is 'The link to an image of a water line, if possible.';
COMMENT ON COLUMN water_line.geometry is 'The location of the water line. Follows EPSG: 4326';

