-- WATER POLYGON TYPE
INSERT INTO water_polygon_type (
    name
) VALUES (
    'wetland'
);

-- WATER POINT TYPE
INSERT INTO water_point_type (
    name, 
	notes
) VALUES (
    'drinking trough',
	'Not clearly marked.' 
); 

-- WATER LINE TYPE
INSERT INTO water_line_type (
    name, 
	notes,
	pipe_length_m,
	pipe_diameter_m
) VALUES (
    'drinking trough',
	'Not clearly marked.',
	'12',
	'0.4'
);

