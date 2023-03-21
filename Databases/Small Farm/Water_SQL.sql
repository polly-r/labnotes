-- WATER SOURCE
CREATE TABLE water_source(
		id SERIAL NOT NULL PRIMARY KEY,
		uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
    	last_update TIMESTAMP DEFAULT now() NOT NULL,
    	last_update_by TEXT NOT NULL,
        name TEXT UNIQUE NOT NULL, 
		notes TEXT, 
		image TEXT,
        sort_order INT UNIQUE
);
COMMENT ON TABLE water_source IS 'Water source refers to the geolocated water bodies that provide drinking water, e.g. Aquifer.';
COMMENT ON COLUMN water_source.id is 'The unique water source ID. This is the Primary Key.';
COMMENT ON COLUMN water_source.uuid is 'The unique user ID.';
COMMENT ON COLUMN water_source.last_update is 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN water_source.last_update_by is 'The name of the user responsible for the latest update.';
COMMENT ON COLUMN water_source.name is 'The name of the water source.';
COMMENT ON COLUMN water_source.notes is 'Additional information of the water body.';
COMMENT ON COLUMN water_source.image is 'Image of the water body.';
COMMENT ON COLUMN water_source.sort_order is 'Defines the pattern of how water source records are to be sorted.';



-- WATER POLYGON TYPE
CREATE TABLE water_polygon_type(
		id SERIAL NOT NULL PRIMARY KEY,
		uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
    	last_update TIMESTAMP DEFAULT now() NOT NULL,
    	last_update_by TEXT NOT NULL,
        name TEXT UNIQUE NOT NULL, 
		notes TEXT, 
		image TEXT,
        sort_order INT UNIQUE
);
COMMENT ON TABLE water_polygon_type IS 'Lookup table of the type of water polygon, e.g. Lake.';
COMMENT ON COLUMN water_polygon_type.id is 'The unique water polygon ID. Primary Key.';
COMMENT ON COLUMN water_polygon_type.uuid is 'The unique user ID.';
COMMENT ON COLUMN water_polygon_type.last_update is 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN water_polygon_type.last_update_by is 'The name of the user responsible for the latest update.';
COMMENT ON COLUMN water_polygon_type.name is 'The name of the water polygon type.';
COMMENT ON COLUMN water_polygon_type.notes is 'Additional information of the water polygon type.';
COMMENT ON COLUMN water_polygon_type.image is 'Image of the water polygon type.';
COMMENT ON COLUMN water_polygon_type.sort_order is 'Defines the pattern of how water polygon type records are to be sorted.';


-- WATER POLYGON
CREATE TABLE water_polygon(
		id SERIAL NOT NULL PRIMARY KEY,
		uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
    	last_update TIMESTAMP DEFAULT now() NOT NULL,
    	last_update_by TEXT NOT NULL,
        name TEXT UNIQUE NOT NULL, 
		notes TEXT, 
		image TEXT,
        sort_order INT UNIQUE,
		estimated_depth_m FLOAT,
		-- 	Estimated depth of water polygon constraint (0m < Estimated Depth < 20m).
		CONSTRAINT depth_check check(
			estimated_depth_m >= 0 and estimated_depth_m <= 20),
		geometry GEOMETRY(POLYGON, 4326),
		water_source_uuid UUID NOT NULL REFERENCES water_source(uuid),
		water_polygon_type_uuid UUID NOT NULL REFERENCES water_polygon_type(uuid)
);
COMMENT ON TABLE water_polygon IS 'Water polygon refers to the geolocated land areas that are covered in water, either intermittently or constantly, e.g. River.';
COMMENT ON COLUMN water_polygon.id is 'The unique water polygon ID. Primary Key.';
COMMENT ON COLUMN water_polygon.uuid is 'The unique user ID.';
COMMENT ON COLUMN water_polygon.last_update is 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN water_polygon.last_update_by is 'The name of the user responsible for the latest update.';
COMMENT ON COLUMN water_polygon.name is 'The name of the water polygon.';
COMMENT ON COLUMN water_polygon.notes is 'Additional information of the water polygon.';
COMMENT ON COLUMN water_polygon.image is 'Image of the water polygon.';
COMMENT ON COLUMN water_polygon.sort_order is 'Defines the pattern of how  water polygons are to be sorted.';
COMMENT ON COLUMN water_polygon.estimated_depth_m is 'The approximate depth of the water polygon measured in meters.';
COMMENT ON COLUMN water_polygon.geometry is 'The location of the water polygon. Follows EPSG: 4326.';


-- WATER POINT TYPE
CREATE TABLE water_point_type (
		id SERIAL NOT NULL PRIMARY KEY,
		uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
    	last_update TIMESTAMP DEFAULT now() NOT NULL,
    	last_update_by TEXT NOT NULL,
        name TEXT UNIQUE NOT NULL, 
		notes TEXT, 
		image TEXT,
        sort_order INT UNIQUE
);
COMMENT ON TABLE water_point_type is 'Lookup table on the types of water points, e.g. Drinking trough.';
COMMENT ON COLUMN water_point_type.id is 'The unique water point type ID. Primary Key.';
COMMENT ON COLUMN water_point_type.uuid is 'The unique user ID.';
COMMENT ON COLUMN water_point_type.last_update is 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN water_point_type.last_update_by is 'The name of the user responsible for the latest update.';
COMMENT ON COLUMN water_point_type.name is 'The name of the water point type.';
COMMENT ON COLUMN water_point_type.notes is 'Additional information of the water point type.';
COMMENT ON COLUMN water_point_type.image is 'Image of the water point type.';
COMMENT ON COLUMN water_point_type.sort_order is 'Defines the pattern of how water point type records are to be sorted.';


-- WATER POINT 
CREATE TABLE water_point(
		id SERIAL NOT NULL PRIMARY KEY,
		uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
    	last_update TIMESTAMP DEFAULT now() NOT NULL,
    	last_update_by TEXT NOT NULL,
        name TEXT UNIQUE NOT NULL, 
		notes TEXT, 
		image TEXT,
        sort_order INT UNIQUE,
		geometry GEOMETRY (POINT, 4326),
		water_source_uuid UUID NOT NULL REFERENCES water_source(uuid),
		water_point_type_uuid UUID NOT NULL REFERENCES water_point_type(uuid)
);
COMMENT ON TABLE water_point is 'Water point refers to the geolocated water site that is available for use, e.g. Tap.';
COMMENT ON COLUMN water_point.id is 'The unique water point ID. Primary Key.';
COMMENT ON COLUMN water_point.uuid is 'The unique user ID.';
COMMENT ON COLUMN water_point.last_update is 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN water_point.last_update_by is 'The name of the user responsible for the latest update.';
COMMENT ON COLUMN water_point.name is 'The name of the water point.';
COMMENT ON COLUMN water_point.notes is 'Additional information of the water point.';
COMMENT ON COLUMN water_point.image is 'Image of the water point.';
COMMENT ON COLUMN water_point.sort_order is 'Defines the pattern of how water point records are to be sorted.';
COMMENT ON COLUMN water_point.geometry is 'The coordinates of the water point. Follows EPSG: 4326.';


-- WATER LINE TYPE
CREATE TABLE water_line_type (
		id SERIAL NOT NULL PRIMARY KEY,
		uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
    	last_update TIMESTAMP DEFAULT now() NOT NULL,
    	last_update_by TEXT NOT NULL,
        name TEXT UNIQUE NOT NULL, 
		notes TEXT, 
		image TEXT,
        sort_order INT UNIQUE,
		material TEXT,
		pipe_length_m FLOAT,
		pipe_diameter_m FLOAT,
		-- Pipe length & pipe diameter constraint (length, diameter > 0)
		CONSTRAINT pipe_length_and_diameter_check check(
			pipe_length_m >= 0 AND pipe_diameter_m >= 0),
		-- Unique together
		UNIQUE(pipe_length_m, pipe_diameter_m)
);
COMMENT ON TABLE water_line_type IS 'Description of the type of line through which water flows, e.g. Water pipe.';
COMMENT ON COLUMN water_line_type.id is 'The unique water line type ID. Primary Key.';
COMMENT ON COLUMN water_line_type.uuid is 'The unique user ID.';
COMMENT ON COLUMN water_line_type.last_update is 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN water_line_type.last_update_by is 'The name of the user responsible for the latest update.';
COMMENT ON COLUMN water_line_type.name is 'The name of the water line type.';
COMMENT ON COLUMN water_line_type.notes is 'Additional information of the water line type.';
COMMENT ON COLUMN water_line_type.image is 'Image of the water line type.';
COMMENT ON COLUMN water_line_type.sort_order is 'Defines the pattern of how water line types are to be sorted.';
COMMENT ON COLUMN water_line_type.material is 'The material that the pipe is made of.';
COMMENT ON COLUMN water_line_type.pipe_length_m is 'The water line length measured in meters.';
COMMENT ON COLUMN water_line_type.pipe_diameter_m is 'The water line diameter measured in meters.';


-- WATER LINE
CREATE TABLE water_line(
		id SERIAL NOT NULL PRIMARY KEY,
		uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
    	last_update TIMESTAMP DEFAULT now() NOT NULL,
    	last_update_by TEXT NOT NULL,
        name TEXT UNIQUE NOT NULL, 
		notes TEXT, 
		image TEXT,
        sort_order INT UNIQUE,
		estimated_depth_m FLOAT,
		--Estimated depth of water line (depth > 0)
		CONSTRAINT estimated_depth_m check(
			estimated_depth_m >= 0),
		
		geometry GEOMETRY(LINESTRING, 4326),
		water_source_uuid UUID NOT NULL REFERENCES water_source(uuid),
		water_line_type_uuid UUID NOT NULL REFERENCES water_line_type(uuid)
);
COMMENT ON TABLE water_line is 'This is the geolocated path the water lines follow.';
COMMENT ON COLUMN water_line.id is 'The unique water line ID. Primary Key.';
COMMENT ON COLUMN water_line.uuid is 'The unique user ID.';
COMMENT ON COLUMN water_line.last_update is 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN water_line.last_update_by is 'The name of the user responsible for the latest update.';
COMMENT ON COLUMN water_line.name is 'The name of the water line.';
COMMENT ON COLUMN water_line.notes is 'Additional information of the water line path.';
COMMENT ON COLUMN water_line.image is 'Image of the water line path.';
COMMENT ON COLUMN water_line.sort_order is 'Defines the pattern of how water lines are to be sorted.';
COMMENT ON COLUMN water_line.estimated_depth_m is 'The approximate depth of the water line measured in meters.';
COMMENT ON COLUMN water_line.geometry is 'The location of the water line. Follows EPSG: 4326';

