--Populating plant_growth_activity_type column with different plant growth stages

INSERT INTO plant_growth_activity_type (name) VALUES ('Sprouting');
INSERT INTO plant_growth_activity_type (name) VALUES ('Seeding');
INSERT INTO plant_growth_activity_type (name) VALUES ('Vegetative');
INSERT INTO plant_growth_activity_type (name) VALUES ('Budding');
INSERT INTO plant_growth_activity_type (name) VALUES ('Flowering');
INSERT INTO plant_growth_activity_type (name) VALUES ('Ripening');
​
--Populating month table with list of the months in a year
INSERT INTO month (name) VALUES ('January');
INSERT INTO month (name) VALUES ('February');
INSERT INTO month (name) VALUES ('March');
INSERT INTO month (name) VALUES ('April');
INSERT INTO month (name) VALUES ('May');
INSERT INTO month (name) VALUES ('June');
INSERT INTO month (name) VALUES ('July');
INSERT INTO month (name) VALUES ('August');
INSERT INTO month (name) VALUES ('September');
INSERT INTO month (name) VALUES ('October');
INSERT INTO month (name) VALUES ('November');
INSERT INTO month (name) VALUES ('December');
​
-- Populating plant_usage with different plant usages
INSERT INTO plant_usage (name) VALUES ('food_plant');
INSERT INTO plant_usage (name) VALUES ('fodder_plant');
INSERT INTO plant_usage (name) VALUES ('commercial_plant');

-- Water
-- WATER SOURCE
INSERT INTO water_source (name) VALUES ('aquifer');
INSERT INTO water_source (name) VALUES ('river');
INSERT INTO water_source (name) VALUES ('reservoir');
INSERT INTO water_source (name) VALUES ('rainwater');


-- WATER POLYGON TYPE
INSERT INTO water_polygon_type (name) VALUES ('wetland');
INSERT INTO water_polygon_type (name) VALUES ('lake');
INSERT INTO water_polygon_type (name) VALUES ('reservoir');
INSERT INTO water_polygon_type (name) VALUES ('pond');

-- WATER POINT TYPE
INSERT INTO water_point_type (name) VALUES ('drinking trough'); 
INSERT INTO water_point_type (name) VALUES ('tap'); 
INSERT INTO water_point_type (name) VALUES ('borehole');
INSERT INTO water_point_type (name) VALUES ('water tank');  

-- WATER LINE TYPE
INSERT INTO water_line_type (name) VALUES ('Irrigation');
INSERT INTO water_line_type (name) VALUES ('stream');
INSERT INTO water_line_type (name) VALUES ('drinking trough');
