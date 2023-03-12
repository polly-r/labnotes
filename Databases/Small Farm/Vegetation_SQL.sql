CREATE TABLE user_update(
	uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	last_update_by TEXT NOT NULL 
);
COMMENT ON TABLE user_update IS 
'Stores information of user and when data was last updated by user.';
COMMENT ON COLUMN user_update.uuid IS 'The unique user ID.';
COMMENT ON COLUMN user_update.last_update IS 'The date and time that the last update was made(yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN user_update.last_update_by IS 'The name of the user responsible for the latest update.';


CREATE TABLE plant_growth_activity_type (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	notes TEXT,
	image TEXT,
	-- constraints are not inherited from parent class and need to be created again in sub-classes 
	CONSTRAINT unique_plant_growth_activity_type_key UNIQUE (uuid)
) INHERITS (user_update);
COMMENT ON TABLE plant_growth_activity_type IS 
'Stores plant growth activity properties.';
COMMENT ON COLUMN plant_growth_activity_type.id IS 'The unique plant growth activity ID. This is the Primary Key.';
COMMENT ON COLUMN plant_growth_activity_type.name IS 'Name of plant activity, e.g. seeding, sprouting etc.';
COMMENT ON COLUMN plant_growth_activity_type.notes IS 'Any additional information about the plant growth activity.';
COMMENT ON COLUMN plant_growth_activity_type.image IS 'Image file path of the associated plant activity.';



CREATE TABLE plant_type(
	id SERIAL NOT NULL PRIMARY KEY,
	common_name TEXT UNIQUE NOT NULL,
	scientific_name TEXT UNIQUE,
	notes TEXT,	
	plant_image TEXT,
	flower_image TEXT,
	fruit_image TEXT,
	variety TEXT,
	info_url TEXT,  --how to validate
	CONSTRAINT unique_plant_type_key UNIQUE (uuid)
) INHERITS (user_update);
COMMENT ON TABLE plant_type IS 
'Look up table of different plant types e.g. Oaktree.';
COMMENT ON COLUMN plant_type.id IS 'The unique plant type ID. This is the Primary Key.';
COMMENT ON COLUMN plant_type.common_name IS 'Common name of the plant type e.g. Oaktree.';
COMMENT ON COLUMN plant_type.scientific_name IS 'Scientific name of the plant type e.g. Quercus.';
COMMENT ON COLUMN plant_type.notes IS 'Any additional information about the specific plant type.';
COMMENT ON COLUMN plant_type.plant_image IS 'Plant image file path for the associated plant type.';
COMMENT ON COLUMN plant_type.flower_image IS 'Flower image file path for the associated plant type. ';
COMMENT ON COLUMN plant_type.fruit_image IS 'Fruit image file path for the associated plant type.';
COMMENT ON COLUMN plant_type.variety IS 'Other variety of this plant type.';
COMMENT ON COLUMN plant_type.info_url IS 'URL link to more information about this specific plant type.';

CREATE TABLE month(
	id SERIAL NOT NULL PRIMARY KEY,
	month TEXT NOT NULL,
	CONSTRAINT unique_month_key UNIQUE (uuid)
)INHERITS (user_update);
COMMENT ON TABLE month IS 
'Look up table for different months of the year';
COMMENT ON COLUMN month.id IS 'The unique month ID. This is the Primary Key.';
COMMENT ON COLUMN month.month IS 'Name of the different months in the year e.g. January';


CREATE TABLE plant_usage(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	notes TEXT,
	CONSTRAINT unique_plant_usage_key UNIQUE (uuid)
) INHERITS (user_update);
COMMENT ON TABLE plant_usage IS 
'Look up table for different usages of the plants e.g. food plant, commercial plant etc.';
COMMENT ON COLUMN plant_usage.id IS 'The unique plant usage ID. This is the Primary Key.';
COMMENT ON COLUMN plant_usage.name IS 'Name of the usage of plant e.g food plant, commercial plant etc.';
COMMENT ON COLUMN plant_usage.notes IS 'Any additional information for the indiviual plant usage.';

CREATE TABLE vegetation_point(
	id SERIAL NOT NULL PRIMARY KEY,
	notes TEXT,
	image TEXT,
	estimated_crown_radius_m FLOAT,
	--Takes 4 digits only
	estimated_planting_year decimal(4,0),
	--Must be before or equal this year
	constraint year_check check(
		estimated_planting_year >= 0),
	constraint year_check2 check(
		estimated_planting_year <= DATE_PART('Year', NOW())),
	estimated_height_m FLOAT,
	geometry GEOMETRY(POINT, 4326) NOT NULL, 
	CONSTRAINT unique_vegetation_point_uuid UNIQUE (uuid),
	plant_type_uuid UUID NOT NULL REFERENCES plant_type(uuid)
) INHERITS (user_update);
COMMENT ON TABLE vegetation_point IS 
'Stores individual plant locations and the properties of that plant.';
COMMENT ON COLUMN vegetation_point.id IS 'The unique vegetation point ID. This is the Primary Key.';
COMMENT ON COLUMN vegetation_point.notes IS 'Any additional information on the individual plant.';
COMMENT ON COLUMN vegetation_point.image IS 'Image file path for the associated plant.';
COMMENT ON COLUMN vegetation_point.estimated_crown_radius_m IS 'Estimated radius of the plant''s crown in meters.';
COMMENT ON COLUMN vegetation_point.estimated_height_m IS 'Estimated height of plant in meters.';
COMMENT ON COLUMN vegetation_point.estimated_planting_year IS 'The year the plant was planted. The year must be in the range of 0 to current year.';
COMMENT ON COLUMN vegetation_point.geometry IS 'The coordinates of the vegetation point. Follows EPSG 4326.';


CREATE TABLE pruning_activity(
	id SERIAL NOT NULL PRIMARY KEY,
	notes TEXT,
	date DATE NOT NULL,
	before_image TEXT,
	after_image TEXT,
	vegetation_point_uuid UUID NOT NULL REFERENCES vegetation_point(uuid)
)INHERITS (user_update);
COMMENT ON TABLE pruning_activity IS 
'Stores information on the trimming of unwanted parts of a plant.';
COMMENT ON COLUMN pruning_activity.id IS 'The unique pruning activity ID. This is the Primary Key.';
COMMENT ON COLUMN pruning_activity.notes IS 'Any additional information on the specific pruning activity.';
COMMENT ON COLUMN pruning_activity.date IS 'The date of the pruning activity (yyyy:mm:dd).';
COMMENT ON COLUMN pruning_activity.before_image IS 'Image file path for the image before the pruning activity was done.';
COMMENT ON COLUMN pruning_activity.after_image IS 'Image file path for the image after the pruning activity was done.';


CREATE TABLE harvest_activity(
	id SERIAL NOT NULL PRIMARY KEY,
	notes TEXT,
	date DATE NOT NULL,
	quantity_kg FLOAT,
	vegetation_point_uuid UUID NOT NULL REFERENCES vegetation_point(uuid)
) INHERITS (user_update);
COMMENT ON TABLE harvest_activity IS 
'Stores information on the gathering of ripe crop or fruits.';
COMMENT ON COLUMN harvest_activity.id IS 'The unique harvest activity ID. This is the Primary Key.';
COMMENT ON COLUMN harvest_activity.notes IS 'Any additional information on the specific harvest activity.';
COMMENT ON COLUMN harvest_activity.date IS 'The date of the harvest activity (yyyy:mm:dd).';
COMMENT ON COLUMN harvest_activity.quantity_kg IS 'The quantity of harvest in kilograms.';
--Association tables

CREATE TABLE plant_growth_activities(
	fk_plant_activity_uuid UUID  NOT NULL REFERENCES plant_growth_activity_type(uuid),
	fk_plant_type_uuid UUID NOT NULL REFERENCES plant_type(uuid),
	fk_month_uuid UUID  NOT NULL REFERENCES month(uuid),
	--making a composite primary key using the three foreign keys above
	PRIMARY KEY (fk_plant_activity_uuid, fk_plant_type_uuid, fk_month_uuid)
);
COMMENT ON TABLE plant_growth_activities IS 
'Associative table to store the plant growth activities and plant types at different months in the year e.g. January_activity.';
COMMENT ON COLUMN plant_growth_activities.fk_plant_activity_uuid IS 'The foreign key linking to plant growth activity type table''s UUID.';
COMMENT ON COLUMN plant_growth_activities.fk_plant_type_uuid IS 'The foreign key linking to plant type table''s UUID.';
COMMENT ON COLUMN plant_growth_activities.fk_month_uuid IS 'The foreign key linking to month table''s UUID.';

CREATE TABLE plant_type_usages(
	fk_plant_usage_uuid UUID NOT NULL REFERENCES plant_usage(uuid),
	fk_plant_type_uuid UUID NOT NULL REFERENCES plant_type(uuid),
	PRIMARY KEY (fk_plant_usage_uuid, fk_plant_type_uuid)
);
COMMENT ON TABLE plant_type_usages IS 
'Associative table to store the different plant usages and plant types ';
COMMENT ON COLUMN plant_type_usages.fk_plant_usage_uuid IS 'The foreign key linking to plant usage table''s UUID.';
COMMENT ON COLUMN plant_type_usages.fk_plant_type_uuid IS 'The foreign key linking to plant type table''s UUID.';
